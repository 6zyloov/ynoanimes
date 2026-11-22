import Foundation

@main
struct LibraryStoreSmokeTests {
    static func main() {
        let suite = "ynoanimes.tests.\(UUID().uuidString)"
        guard let defaults = UserDefaults(suiteName: suite) else {
            fatalError("Não foi possível criar UserDefaults isolado")
        }
        defer { defaults.removePersistentDomain(forName: suite) }
        let store = LibraryStore(defaults: defaults)

        precondition(store.favoriteIDs().isEmpty)
        store.setFavorite(true, animeID: "anime-1")
        store.setFavorite(true, animeID: "anime-2")
        precondition(store.favoriteIDs() == Set(["anime-1", "anime-2"]))
        store.setFavorite(false, animeID: "anime-1")
        precondition(store.favoriteIDs() == Set(["anime-2"]))

        let first = PlaybackProgress(animeID: "anime-2", episodeID: "ep-1",
            positionSeconds: 25, durationSeconds: 1200, updatedAt: Date(timeIntervalSince1970: 100))
        store.saveProgress(first)
        let updated = PlaybackProgress(animeID: "anime-2", episodeID: "ep-1",
            positionSeconds: 80, durationSeconds: 1200, updatedAt: Date(timeIntervalSince1970: 200))
        store.saveProgress(updated)
        precondition(store.allProgress().count == 1)
        precondition(store.allProgress().first?.positionSeconds == 80)
        store.removeProgress(animeID: "anime-2", episodeID: "ep-1")
        precondition(store.allProgress().isEmpty)
        print("PASS: favoritos e progresso local persistem, atualizam e removem corretamente")
    }
}
