import Foundation

struct Anime: Codable, Hashable, Identifiable {
    let id: String
    let title: String
    let synopsis: String?
    let posterURL: URL?
}

struct PlaybackProgress: Codable, Equatable {
    let animeID: String
    let episodeID: String
    let positionSeconds: Double
    let durationSeconds: Double?
    let updatedAt: Date
}

enum CatalogError: Error, Equatable {
    case unavailable
}

protocol CatalogProvider {
    func searchAnime(query: String, completion: @escaping (Result<[Anime], CatalogError>) -> Void)
}

/// Free public metadata catalog. This provider returns anime information only;
/// it does not provide episode streams or imply distribution rights.
final class AniListCatalogProvider: CatalogProvider {
    private let endpoint = URL(string: "https://graphql.anilist.co")!

    func searchAnime(query: String, completion: @escaping (Result<[Anime], CatalogError>) -> Void) {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            completion(.success([]))
            return
        }

        let graphQL = """
        query ($search: String!, $page: Int!, $perPage: Int!) {
          Page(page: $page, perPage: $perPage) {
            media(search: $search, type: ANIME, isAdult: false, sort: SEARCH_MATCH) {
              id
              title { romaji english native }
              description(asHtml: false)
              coverImage { large }
            }
          }
        }
        """

        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.timeoutInterval = 20
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let body: [String: Any] = [
            "query": graphQL,
            "variables": ["search": trimmed, "page": 1, "perPage": 20]
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(.unavailable))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let data,
                  let http = response as? HTTPURLResponse,
                  (200..<300).contains(http.statusCode),
                  let root = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let payload = root["data"] as? [String: Any],
                  let page = payload["Page"] as? [String: Any],
                  let media = page["media"] as? [[String: Any]] else {
                completion(.failure(.unavailable))
                return
            }

            let items: [Anime] = media.compactMap { item in
                guard let rawID = item["id"] as? Int,
                      let titleData = item["title"] as? [String: Any] else { return nil }

                let title = (titleData["english"] as? String)
                    ?? (titleData["romaji"] as? String)
                    ?? (titleData["native"] as? String)
                guard let title, !title.isEmpty else { return nil }

                let synopsis = item["description"] as? String
                let cover = (item["coverImage"] as? [String: Any])?["large"] as? String
                let posterURL = cover.flatMap(URL.init(string:))

                return Anime(
                    id: String(rawID),
                    title: title,
                    synopsis: synopsis,
                    posterURL: posterURL
                )
            }
            completion(.success(items))
        }.resume()
    }
}

final class LibraryStore {
    static let shared = LibraryStore()

    private enum Keys {
        static let favorites = "ynoanimes.library.favorites.v1"
        static let progress = "ynoanimes.library.progress.v1"
    }

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func favoriteIDs() -> Set<String> {
        Set(defaults.stringArray(forKey: Keys.favorites) ?? [])
    }

    func isFavorite(animeID: String) -> Bool {
        favoriteIDs().contains(animeID)
    }

    func setFavorite(_ isFavorite: Bool, animeID: String) {
        var ids = favoriteIDs()
        if isFavorite { ids.insert(animeID) } else { ids.remove(animeID) }
        defaults.set(ids.sorted(), forKey: Keys.favorites)
    }

    func allProgress() -> [PlaybackProgress] {
        guard let data = defaults.data(forKey: Keys.progress),
              let items = try? JSONDecoder().decode([PlaybackProgress].self, from: data) else { return [] }
        return items.sorted { $0.updatedAt > $1.updatedAt }
    }

    func saveProgress(_ item: PlaybackProgress) {
        var items = allProgress().filter { !($0.animeID == item.animeID && $0.episodeID == item.episodeID) }
        items.append(item)
        guard let data = try? JSONEncoder().encode(items) else { return }
        defaults.set(data, forKey: Keys.progress)
    }

    func removeProgress(animeID: String, episodeID: String) {
        let items = allProgress().filter { !($0.animeID == animeID && $0.episodeID == episodeID) }
        guard let data = try? JSONEncoder().encode(items) else { return }
        defaults.set(data, forKey: Keys.progress)
    }
}
