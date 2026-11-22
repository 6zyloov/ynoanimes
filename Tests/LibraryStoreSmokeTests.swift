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

        precondition(store.libraryEntries().isEmpty)
        precondition(store.addLibraryEntry(title: "Naruto"))
        precondition(!store.addLibraryEntry(title: "  naruto  "))
        let savedEntry = store.libraryEntries().first
        precondition(savedEntry?.title == "Naruto")
        precondition(savedEntry?.status == "quero assistir")
        guard let entryID = savedEntry?.id else { fatalError("Entrada não foi salva") }
        precondition(store.updateLibraryEntry(id: entryID, status: "assistindo"))
        precondition(store.libraryEntries().first?.status == "assistindo")
        precondition(!store.updateLibraryEntry(id: entryID, status: "status inválido"))
        precondition(store.removeLibraryEntry(id: entryID))
        precondition(store.libraryEntries().isEmpty)

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
        print("PASS: favoritos, biblioteca local e progresso persistem, atualizam e removem corretamente")
    }
}
