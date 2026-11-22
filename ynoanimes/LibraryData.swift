import Foundation

struct PlaybackProgress: Codable, Equatable {
    let animeID: String
    let episodeID: String
    let positionSeconds: Double
    let durationSeconds: Double?
    let updatedAt: Date
}

enum LibraryStatus {
    static let all = ["quero assistir", "assistindo", "concluído", "pausado"]
}

struct LibraryEntry: Codable, Equatable, Identifiable {
    let id: String
    let title: String
    var status: String
    let addedAt: Date
    var updatedAt: Date

    init(id: String = UUID().uuidString,
         title: String,
         status: String = "quero assistir",
         addedAt: Date = Date(),
         updatedAt: Date = Date()) {
        self.id = id
        self.title = title
        self.status = LibraryStatus.all.contains(status) ? status : "quero assistir"
        self.addedAt = addedAt
        self.updatedAt = updatedAt
    }
}

// Metadata and episode catalog integrations stay disabled until a provider's
// terms explicitly authorize use in an independent commercial anime app.

final class LibraryStore {
    static let shared = LibraryStore()

    private enum Keys {
        static let favorites = "ynoanimes.library.favorites.v1"
        static let progress = "ynoanimes.library.progress.v1"
        static let entries = "ynoanimes.library.entries.v1"
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

    func libraryEntries() -> [LibraryEntry] {
        guard let data = defaults.data(forKey: Keys.entries),
              let items = try? JSONDecoder().decode([LibraryEntry].self, from: data) else { return [] }
        return items.sorted { $0.updatedAt > $1.updatedAt }
    }

    @discardableResult
    func addLibraryEntry(title: String, status: String = "quero assistir") -> Bool {
        let cleaned = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !cleaned.isEmpty else { return false }

        let normalized = cleaned.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current)
        guard !libraryEntries().contains(where: {
            $0.title.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current) == normalized
        }) else { return false }

        var items = libraryEntries()
        items.append(LibraryEntry(title: cleaned, status: status))
        return saveLibraryEntries(items)
    }

    @discardableResult
    func updateLibraryEntry(id: String, status: String) -> Bool {
        guard LibraryStatus.all.contains(status) else { return false }
        var items = libraryEntries()
        guard let index = items.firstIndex(where: { $0.id == id }) else { return false }
        items[index].status = status
        items[index].updatedAt = Date()
        return saveLibraryEntries(items)
    }

    @discardableResult
    func removeLibraryEntry(id: String) -> Bool {
        let items = libraryEntries().filter { $0.id != id }
        return saveLibraryEntries(items)
    }

    private func saveLibraryEntries(_ items: [LibraryEntry]) -> Bool {
        guard let data = try? JSONEncoder().encode(items) else { return false }
        defaults.set(data, forKey: Keys.entries)
        return true
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
