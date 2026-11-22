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
    case providerNotConfigured
    case unavailable
}

protocol CatalogProvider {
    func searchAnime(query: String, completion: @escaping (Result<[Anime], CatalogError>) -> Void)
}

final class UnconfiguredCatalogProvider: CatalogProvider {
    func searchAnime(query: String, completion: @escaping (Result<[Anime], CatalogError>) -> Void) {
        completion(.failure(.providerNotConfigured))
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
