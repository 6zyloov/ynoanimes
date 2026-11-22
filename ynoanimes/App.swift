import UIKit
import AVKit
import AVFoundation

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        YTheme.apply()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = YTabs()
        window.backgroundColor = .black
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

enum YTheme {
    static let bg = UIColor.black
    static let card = UIColor(white: 0.075, alpha: 1)
    static let raised = UIColor(white: 0.13, alpha: 1)
    static let white = UIColor.white
    static let muted = UIColor(white: 0.65, alpha: 1)
    static let line = UIColor(white: 0.2, alpha: 1)

    static func apply() {
        let nav = UINavigationBarAppearance()
        nav.configureWithOpaqueBackground()
        nav.backgroundColor = bg
        nav.titleTextAttributes = [.foregroundColor: white]
        nav.largeTitleTextAttributes = [.foregroundColor: white]
        UINavigationBar.appearance().standardAppearance = nav
        UINavigationBar.appearance().scrollEdgeAppearance = nav
        UINavigationBar.appearance().tintColor = white

        let tab = UITabBarAppearance()
        tab.configureWithOpaqueBackground()
        tab.backgroundColor = bg
        tab.shadowColor = line
        UITabBar.appearance().standardAppearance = tab
        UITabBar.appearance().scrollEdgeAppearance = tab
        UITabBar.appearance().tintColor = white
        UITabBar.appearance().unselectedItemTintColor = muted
    }

    static func label(_ text: String, _ size: CGFloat = 15, _ weight: UIFont.Weight = .regular, _ color: UIColor = white) -> UILabel {
        let v = UILabel()
        v.text = text
        v.font = .systemFont(ofSize: size, weight: weight)
        v.textColor = color
        v.numberOfLines = 0
        v.adjustsFontForContentSizeCategory = true
        return v
    }

    static func makeCard() -> UIView {
        let v = UIView()
        v.backgroundColor = card
        v.layer.cornerRadius = 18
        v.layer.cornerCurve = .continuous
        return v
    }
}

final class YTabs: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let items: [(UIViewController, String, String)] = [
            (HomeScreen(), "início", "house"),
            (SearchScreen(), "buscar", "magnifyingglass"),
            (LibraryScreen(), "biblioteca", "bookmark"),
            (ProviderDirectoryScreen(), "fontes", "play.rectangle.on.tv"),
            (SettingsScreen(), "ajustes", "slider.horizontal.3")
        ]
        viewControllers = items.map { controller, title, symbol in
            let nav = UINavigationController(rootViewController: controller)
            nav.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: symbol), selectedImage: UIImage(systemName: symbol))
            return nav
        }
    }
}

final class HomeScreen: UIViewController {
    private let shortcuts: [(String, String, URL)] = [
        ("naruto", "mercado play · grátis listado", URL(string: "https://play.mercadolivre.com.br/assistir/naruto/be679bf2952a48619325b2fd063e0641")!),
        ("death note", "mercado play · grátis listado", URL(string: "https://play.mercadolivre.com.br/assistir/death-note/232ef0bc387347cb9113b8bd82f044cd")!),
        ("hunter x hunter", "mercado play · grátis listado", URL(string: "https://play.mercadolivre.com.br/assistir/hunter-x-hunter/1b83745cab2343efb5ad243c4ecb8a31")!),
        ("special a", "mercado play · grátis listado", URL(string: "https://play.mercadolivre.com.br/assistir/special-a/768c34414ded497e9e23cedbf5887597")!),
        ("anime sato · série em português", "playlist oficial · 12 episódios", URL(string: "https://www.youtube.com/playlist?list=PLe0jn-R7nFs4")!),
        ("crunchyroll · episódios selecionados", "playlist oficial · temporadas completas podem ser pagas", URL(string: "https://www.youtube.com/playlist?list=PLvdPoYtCK3rNsMQ4zL-OpuWd0cwKZqbSN")!),
        ("pluto tv · anime", "canais ao vivo · grátis com anúncios", URL(string: "https://pluto.tv/br/watch/live-tv/category/anime-geek-br/")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .never

        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(stack)

        let brand = UIStackView(arrangedSubviews: [
            YTheme.label("yno animes", 31, .bold),
            YTheme.label("descubra. acompanhe. guarde.", 13, .medium, YTheme.muted)
        ])
        brand.axis = .vertical
        brand.spacing = 4
        stack.addArrangedSubview(brand)

        let hero = YTheme.makeCard()
        hero.layer.borderWidth = 1
        hero.layer.borderColor = YTheme.line.cgColor
        let heroContent = UIStackView()
        heroContent.axis = .vertical
        heroContent.spacing = 13
        heroContent.translatesAutoresizingMaskIntoConstraints = false
        hero.addSubview(heroContent)

        let eyebrow = YTheme.label("SEU UNIVERSO DE ANIME", 10, .bold, YTheme.muted)
        let headline = YTheme.label("sua próxima\nhistória começa aqui.", 29, .bold)
        let description = YTheme.label(
            "Encontre fontes oficiais, descubra onde assistir e monte sua própria biblioteca.",
            14, .regular, YTheme.muted
        )
        heroContent.addArrangedSubview(eyebrow)
        heroContent.addArrangedSubview(headline)
        heroContent.addArrangedSubview(description)

        let actions = UIStackView()
        actions.axis = .vertical
        actions.spacing = 9
        let sourcesButton = makeHomeButton(title: "explorar fontes oficiais", primary: true)
        sourcesButton.addTarget(self, action: #selector(openSources), for: .touchUpInside)
        let searchButton = makeHomeButton(title: "buscar onde assistir", primary: false)
        searchButton.addTarget(self, action: #selector(openSearch), for: .touchUpInside)
        actions.addArrangedSubview(sourcesButton)
        actions.addArrangedSubview(searchButton)
        heroContent.addArrangedSubview(actions)

        NSLayoutConstraint.activate([
            heroContent.topAnchor.constraint(equalTo: hero.topAnchor, constant: 21),
            heroContent.leadingAnchor.constraint(equalTo: hero.leadingAnchor, constant: 19),
            heroContent.trailingAnchor.constraint(equalTo: hero.trailingAnchor, constant: -19),
            heroContent.bottomAnchor.constraint(equalTo: hero.bottomAnchor, constant: -21)
        ])
        stack.addArrangedSubview(hero)

        stack.addArrangedSubview(sectionHeading("comece por aqui", subtitle: "Títulos com páginas oficiais identificadas como gratuitas. Confirme a disponibilidade ao abrir."))

        for item in shortcuts {
            stack.addArrangedSubview(makeShortcutCard(title: item.0, detail: item.1, url: item.2))
        }

        let library = YTheme.makeCard()
        let libraryContent = UIStackView(arrangedSubviews: [
            YTheme.label("sua biblioteca", 17, .semibold),
            YTheme.label("Guarde títulos, organize o que está assistindo e mantenha sua lista neste aparelho.", 13, .regular, YTheme.muted)
        ])
        libraryContent.axis = .vertical
        libraryContent.spacing = 7
        let libraryButton = makeHomeButton(title: "abrir minha biblioteca", primary: false)
        libraryButton.addTarget(self, action: #selector(openLibrary), for: .touchUpInside)
        let libraryStack = UIStackView(arrangedSubviews: [libraryContent, libraryButton])
        libraryStack.axis = .vertical
        libraryStack.spacing = 13
        libraryStack.translatesAutoresizingMaskIntoConstraints = false
        library.addSubview(libraryStack)
        NSLayoutConstraint.activate([
            libraryStack.topAnchor.constraint(equalTo: library.topAnchor, constant: 17),
            libraryStack.leadingAnchor.constraint(equalTo: library.leadingAnchor, constant: 17),
            libraryStack.trailingAnchor.constraint(equalTo: library.trailingAnchor, constant: -17),
            libraryStack.bottomAnchor.constraint(equalTo: library.bottomAnchor, constant: -17)
        ])
        stack.addArrangedSubview(library)

        stack.addArrangedSubview(YTheme.label(
            "A reprodução acontece no serviço oficial. O ynoanimes não hospeda nem copia episódios.",
            11, .regular, YTheme.muted
        ))

        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stack.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor, constant: 23),
            stack.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 19),
            stack.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -19),
            stack.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor, constant: -26)
        ])
    }

    private func sectionHeading(_ title: String, subtitle: String) -> UIView {
        let group = UIStackView(arrangedSubviews: [
            YTheme.label(title, 19, .bold),
            YTheme.label(subtitle, 12, .regular, YTheme.muted)
        ])
        group.axis = .vertical
        group.spacing = 5
        return group
    }

    private func makeHomeButton(title: String, primary: Bool) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(primary ? .black : .white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = primary ? .white : YTheme.raised
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 13, left: 15, bottom: 13, right: 15)
        button.contentHorizontalAlignment = .center
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 46).isActive = true
        return button
    }

    private func makeShortcutCard(title: String, detail: String, url: URL) -> UIView {
        let card = YTheme.makeCard()
        let labels = UIStackView(arrangedSubviews: [
            YTheme.label(title, 16, .semibold),
            YTheme.label(detail, 11, .medium, YTheme.muted)
        ])
        labels.axis = .vertical
        labels.spacing = 5
        let button = ExternalProviderButton(title: "abrir ↗", destination: url)
        let row = UIStackView(arrangedSubviews: [labels, button])
        row.axis = .horizontal
        row.alignment = .center
        row.spacing = 12
        labels.setContentHuggingPriority(.defaultLow, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        row.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(row)
        NSLayoutConstraint.activate([
            row.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),
            row.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 15),
            row.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -15),
            row.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -14)
        ])
        return card
    }

    @objc private func openSources() { tabBarController?.selectedIndex = 3 }
    @objc private func openSearch() { tabBarController?.selectedIndex = 1 }
    @objc private func openLibrary() { tabBarController?.selectedIndex = 2 }
}

final class SearchScreen: UIViewController, UITextFieldDelegate {
    private let field = UITextField()
    private let hint = YTheme.label(
        "A busca abre o JustWatch Brasil para localizar onde o anime está disponível legalmente. O ynoanimes não consulta uma API de catálogo sem autorização.",
        14, .regular, YTheme.muted
    )
    private let searchButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "buscar"
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .always

        field.placeholder = "nome do anime"
        field.textColor = YTheme.white
        field.tintColor = YTheme.white
        field.backgroundColor = YTheme.card
        field.layer.cornerRadius = 12
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        field.leftViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        field.rightViewMode = .always
        field.returnKeyType = .search
        field.delegate = self
        field.heightAnchor.constraint(equalToConstant: 52).isActive = true

        searchButton.setTitle("buscar disponibilidade oficial ↗", for: .normal)
        searchButton.setTitleColor(YTheme.white, for: .normal)
        searchButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        searchButton.backgroundColor = YTheme.raised
        searchButton.layer.cornerRadius = 12
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 15, left: 18, bottom: 15, right: 18)
        searchButton.addTarget(self, action: #selector(openOfficialSearch), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [
            field,
            hint,
            searchButton,
            YTheme.label(
                "A disponibilidade muda por país, temporada e período. Confirme idioma, preço e acesso gratuito no serviço de destino.",
                12, .regular, YTheme.muted
            )
        ])
        stack.axis = .vertical
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        openOfficialSearch()
        return true
    }

    @objc private func openOfficialSearch() {
        guard let query = field.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !query.isEmpty,
              var components = URLComponents(string: "https://www.justwatch.com/br/busca") else { return }
        components.queryItems = [URLQueryItem(name: "q", value: query)]
        guard let url = components.url else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

final class LibraryScreen: UIViewController {
    private let entriesStack = UIStackView()
    private let summaryLabel = YTheme.label("", 13, .regular, YTheme.muted)
    private let emptyLabel = YTheme.label(
        "Sua lista ainda está vazia. Adicione um anime para começar a organizar seu universo.",
        14, .regular, YTheme.muted
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "biblioteca"
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTitle)
        )

        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 17
        stack.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(stack)

        let intro = UIStackView(arrangedSubviews: [
            YTheme.label("sua coleção", 23, .bold),
            YTheme.label("Uma lista pessoal salva somente neste iPhone.", 13, .regular, YTheme.muted)
        ])
        intro.axis = .vertical
        intro.spacing = 5
        stack.addArrangedSubview(intro)

        let summaryCard = YTheme.makeCard()
        summaryLabel.numberOfLines = 0
        summaryLabel.text = "0 títulos na sua lista"
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryCard.addSubview(summaryLabel)
        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: summaryCard.topAnchor, constant: 16),
            summaryLabel.leadingAnchor.constraint(equalTo: summaryCard.leadingAnchor, constant: 16),
            summaryLabel.trailingAnchor.constraint(equalTo: summaryCard.trailingAnchor, constant: -16),
            summaryLabel.bottomAnchor.constraint(equalTo: summaryCard.bottomAnchor, constant: -16)
        ])
        stack.addArrangedSubview(summaryCard)

        let heading = YTheme.label("minha lista", 18, .bold)
        stack.addArrangedSubview(heading)
        entriesStack.axis = .vertical
        entriesStack.spacing = 11
        stack.addArrangedSubview(entriesStack)

        stack.addArrangedSubview(YTheme.label(
            "O histórico de episódios e o progresso automático serão ativados quando houver uma fonte de reprodução autorizada conectada.",
            11, .regular, YTheme.muted
        ))

        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stack.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor, constant: 22),
            stack.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 18),
            stack.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -18),
            stack.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor, constant: -26)
        ])
        refreshLibrary()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshLibrary()
    }

    private func refreshLibrary() {
        let items = LibraryStore.shared.libraryEntries()
        let watching = items.filter { $0.status == "assistindo" }.count
        let planned = items.filter { $0.status == "quero assistir" }.count
        let completed = items.filter { $0.status == "concluído" }.count
        summaryLabel.text = "(items.count) título(s)\n\(watching) assistindo  ·  (planned) na lista  ·  (completed) concluído(s)"

        entriesStack.arrangedSubviews.forEach {
            entriesStack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }

        if items.isEmpty {
            let emptyCard = YTheme.makeCard()
            emptyLabel.translatesAutoresizingMaskIntoConstraints = false
            emptyCard.addSubview(emptyLabel)
            NSLayoutConstraint.activate([
                emptyLabel.topAnchor.constraint(equalTo: emptyCard.topAnchor, constant: 18),
                emptyLabel.leadingAnchor.constraint(equalTo: emptyCard.leadingAnchor, constant: 16),
                emptyLabel.trailingAnchor.constraint(equalTo: emptyCard.trailingAnchor, constant: -16),
                emptyLabel.bottomAnchor.constraint(equalTo: emptyCard.bottomAnchor, constant: -18)
            ])
            entriesStack.addArrangedSubview(emptyCard)
            return
        }

        items.forEach { entriesStack.addArrangedSubview(makeEntryCard($0)) }
    }

    private func makeEntryCard(_ entry: LibraryEntry) -> UIView {
        let card = YTheme.makeCard()
        let title = YTheme.label(entry.title, 16, .semibold)
        let status = YTheme.label(entry.status.uppercased(), 10, .bold, YTheme.muted)
        let labels = UIStackView(arrangedSubviews: [title, status])
        labels.axis = .vertical
        labels.spacing = 6

        let updateButton = UIButton(type: .system)
        updateButton.setTitle("alterar status", for: .normal)
        updateButton.setTitleColor(.white, for: .normal)
        updateButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        updateButton.backgroundColor = YTheme.raised
        updateButton.layer.cornerRadius = 9
        updateButton.contentEdgeInsets = UIEdgeInsets(top: 9, left: 11, bottom: 9, right: 11)
        updateButton.accessibilityIdentifier = entry.id
        updateButton.addTarget(self, action: #selector(changeStatus(_:)), for: .touchUpInside)

        let removeButton = UIButton(type: .system)
        removeButton.setTitle("remover", for: .normal)
        removeButton.setTitleColor(YTheme.muted, for: .normal)
        removeButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        removeButton.accessibilityIdentifier = entry.id
        removeButton.addTarget(self, action: #selector(removeEntry(_:)), for: .touchUpInside)

        let actions = UIStackView(arrangedSubviews: [updateButton, removeButton])
        actions.axis = .horizontal
        actions.spacing = 8
        actions.alignment = .center

        let content = UIStackView(arrangedSubviews: [labels, actions])
        content.axis = .vertical
        content.spacing = 12
        content.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(content)
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: card.topAnchor, constant: 15),
            content.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 15),
            content.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -15),
            content.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -15)
        ])
        return card
    }

    @objc private func addTitle() {
        let alert = UIAlertController(title: "adicionar à biblioteca", message: "Salve um título na sua lista pessoal.", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "nome do anime"
            field.autocapitalizationType = .words
            field.returnKeyType = .done
        }
        alert.addAction(UIAlertAction(title: "cancelar", style: .cancel))
        alert.addAction(UIAlertAction(title: "adicionar", style: .default) { [weak self, weak alert] _ in
            guard let self, let title = alert?.textFields?.first?.text,
                  !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
            if !LibraryStore.shared.addLibraryEntry(title: title) {
                self.showMessage(title: "título já cadastrado", message: "Esse anime já está na sua biblioteca.")
            }
            self.refreshLibrary()
        })
        present(alert, animated: true)
    }

    @objc private func changeStatus(_ sender: UIButton) {
        guard let id = sender.accessibilityIdentifier else { return }
        let alert = UIAlertController(title: "status do anime", message: nil, preferredStyle: .actionSheet)
        for status in LibraryStatus.all {
            alert.addAction(UIAlertAction(title: status, style: .default) { [weak self] _ in
                _ = LibraryStore.shared.updateLibraryEntry(id: id, status: status)
                self?.refreshLibrary()
            })
        }
        alert.addAction(UIAlertAction(title: "cancelar", style: .cancel))
        if let popover = alert.popoverPresentationController {
            popover.barButtonItem = navigationItem.rightBarButtonItem
        }
        present(alert, animated: true)
    }

    @objc private func removeEntry(_ sender: UIButton) {
        guard let id = sender.accessibilityIdentifier else { return }
        let alert = UIAlertController(title: "remover da biblioteca?", message: "O título será retirado da sua lista neste aparelho.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancelar", style: .cancel))
        alert.addAction(UIAlertAction(title: "remover", style: .destructive) { [weak self] _ in
            _ = LibraryStore.shared.removeLibraryEntry(id: id)
            self?.refreshLibrary()
        })
        present(alert, animated: true)
    }

    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "entendi", style: .default))
        present(alert, animated: true)
    }
}

final class SettingsScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ajustes"
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .always
        let stack = UIStackView(arrangedSubviews: [
            YTheme.label("yno animes", 22, .bold),
            YTheme.label("versão de desenvolvimento", 13, .regular, YTheme.muted),
            YTheme.label("dispositivo-alvo\n iPhone 6s Plus · iOS 15.8.8 · Dopamine", 14, .regular, YTheme.muted),
            YTheme.label("Sem sessões privadas do Tomato, senhas, cookies ou fontes de episódios sem autorização.", 13, .regular, YTheme.muted)
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
    }
}

/// An alternate full-episode rendition for providers that publish separate
/// dubbed editions instead of multiple audio tracks in one media asset.
struct PlaybackLanguageEdition {
    let languageCode: String
    let label: String
    let url: URL

    init?(languageCode: String, label: String, url: URL) {
        let code = languageCode.trimmingCharacters(in: .whitespacesAndNewlines)
        let name = label.trimmingCharacters(in: .whitespacesAndNewlines)
        guard url.scheme?.lowercased() == "https",
              !code.isEmpty,
              !name.isEmpty else { return nil }
        self.languageCode = code
        self.label = name
        self.url = url
    }
}

/// Must be created only by an integration that has verified the right to provide this media.
struct PlayableMedia {
    let url: URL
    let title: String
    let episodeTitle: String
    let originalLanguageCode: String
    let alternateEditions: [PlaybackLanguageEdition]

    init?(url: URL,
          title: String,
          episodeTitle: String,
          originalLanguageCode: String = "ja",
          alternateEditions: [PlaybackLanguageEdition] = []) {
        guard url.scheme?.lowercased() == "https",
              alternateEditions.allSatisfy({ $0.url.scheme?.lowercased() == "https" }) else { return nil }
        self.url = url
        self.title = title
        self.episodeTitle = episodeTitle
        self.originalLanguageCode = originalLanguageCode
        self.alternateEditions = alternateEditions
    }
}

/// Provides an in-player language menu for both embedded audio tracks and
/// separately published dubbed editions. A provider must supply real,
/// synchronized editions; this UI never fabricates language tracks.
final class PlaybackScreen: AVPlayerViewController {
    private let media: PlayableMedia
    private var activeEditionLanguage: String

    init(media: PlayableMedia) {
        self.media = media
        self.activeEditionLanguage = media.originalLanguageCode
        super.init(nibName: nil, bundle: nil)
        player = AVPlayer(url: media.url)
        title = media.title
        navigationItem.prompt = media.episodeTitle
        player?.allowsExternalPlayback = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) não é suportado") }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "áudio",
            style: .plain,
            target: self,
            action: #selector(showAudioOptions)
        )
    }

    @objc private func showAudioOptions() {
        guard let item = player?.currentItem else { return }
        let alert = UIAlertController(title: "idioma do áudio", message: nil, preferredStyle: .actionSheet)

        if let group = item.asset.mediaSelectionGroup(forMediaCharacteristic: .audible) {
            for option in group.options {
                let label = option.displayName
                let language = option.extendedLanguageTag ?? ""
                let title = language.isEmpty ? label : "\(label) · \(language)"
                let selected = item.currentMediaSelection.selectedMediaOption(in: group)?.isEqual(option) == true
                let actionTitle = selected ? "✓ " + title : title
                let action = UIAlertAction(title: actionTitle, style: .default) { [weak item] _ in
                    item?.select(option, in: group)
                }
                alert.addAction(action)
            }
        }

        for edition in media.alternateEditions {
            let selected = activeEditionLanguage == edition.languageCode
            let actionTitle = selected ? "✓ " + edition.label : edition.label
            let action = UIAlertAction(title: actionTitle, style: .default) { [weak self] _ in
                self?.switchEdition(edition)
            }
            alert.addAction(action)
        }

        if alert.actions.isEmpty {
            alert.message = "Esta fonte não publicou outras faixas ou versões de áudio para este episódio."
        }
        alert.addAction(UIAlertAction(title: "cancelar", style: .cancel))
        if let popover = alert.popoverPresentationController {
            popover.barButtonItem = navigationItem.rightBarButtonItem
        }
        present(alert, animated: true)
    }

    private func switchEdition(_ edition: PlaybackLanguageEdition) {
        guard let player else { return }
        let wasPlaying = player.timeControlStatus == .playing
        let currentTime = player.currentTime()
        let safeTime = currentTime.isValid && currentTime.isNumeric ? currentTime : .zero
        let replacement = AVPlayerItem(url: edition.url)
        activeEditionLanguage = edition.languageCode
        player.replaceCurrentItem(with: replacement)
        player.seek(to: safeTime, toleranceBefore: .zero, toleranceAfter: .zero) { [weak player] finished in
            guard finished, wasPlaying else { return }
            player?.play()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player?.pause()
    }
}


private struct OfficialProvider {
    let name: String
    let category: String
    let detail: String
    let url: URL
}

private final class ExternalProviderButton: UIButton {
    private let destination: URL

    init(title: String, destination: URL) {
        self.destination = destination
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        backgroundColor = .white
        layer.cornerRadius = 11
        contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        addTarget(self, action: #selector(openDestination), for: .touchUpInside)
        accessibilityHint = "Abre o serviço oficial fora do ynoanimes"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) não é suportado")
    }

    @objc private func openDestination() {
        UIApplication.shared.open(destination, options: [:], completionHandler: nil)
    }
}

final class ProviderDirectoryScreen: UIViewController {
    private let providers: [OfficialProvider] = [
        OfficialProvider(
            name: "mercado play · catálogo grátis",
            category: "sob demanda · gratuito com anúncios",
            detail: "Páginas oficiais listam Naruto, Death Note e Hunter x Hunter como grátis no Brasil. A disponibilidade pode mudar por título, temporada e região.",
            url: URL(string: "https://play.mercadolivre.com.br/")!
        ),
        OfficialProvider(
            name: "naruto",
            category: "mercado play · página oficial grátis",
            detail: "Atalho direto para a página de Naruto. Confirme temporadas e episódios liberados no próprio serviço.",
            url: URL(string: "https://play.mercadolivre.com.br/assistir/naruto/be679bf2952a48619325b2fd063e0641")!
        ),
        OfficialProvider(
            name: "death note",
            category: "mercado play · página oficial grátis",
            detail: "Atalho direto para a página de Death Note. Confirme disponibilidade e idioma antes de começar.",
            url: URL(string: "https://play.mercadolivre.com.br/assistir/death-note/232ef0bc387347cb9113b8bd82f044cd")!
        ),
        OfficialProvider(
            name: "hunter x hunter",
            category: "mercado play · página oficial grátis",
            detail: "Atalho direto para a página de Hunter x Hunter. Confirme temporadas e episódios liberados no próprio serviço.",
            url: URL(string: "https://play.mercadolivre.com.br/assistir/hunter-x-hunter/1b83745cab2343efb5ad243c4ecb8a31")!
        ),
        OfficialProvider(
            name: "special a",
            category: "mercado play · página oficial grátis",
            detail: "Página oficial de Special A identificada como grátis no Mercado Play Brasil. Confirme temporadas, idioma e episódios disponíveis ao abrir.",
            url: URL(string: "https://play.mercadolivre.com.br/assistir/special-a/768c34414ded497e9e23cedbf5887597")!
        ),
        OfficialProvider(
            name: "inazuma eleven · episódio",
            category: "mercado play · episódio listado como grátis",
            detail: "Atalho para Os Estrangeiros Estão Aqui. A página indexada informa acesso grátis; confirme se o episódio e a temporada continuam liberados.",
            url: URL(string: "https://play.mercadolivre.com.br/assistir/inazuma-eleven-os-estrangeiros-estao-aqui-1-27/47d5584ffb974e74ac69ff45cdcdf0d0")!
        ),
        OfficialProvider(
            name: "beyblade burst · episódio",
            category: "mercado play · episódio listado como grátis",
            detail: "Atalho para Na Escuridão! Dark Doomscizor!. A página indexada informa acesso grátis; confirme disponibilidade e idioma no serviço.",
            url: URL(string: "https://play.mercadolivre.com.br/assistir/beyblade-burst-na-escuridao-dark-doomscizor-1-5/61cd0c7842fe4a86bf69e1137cf2c4b2")!
        ),
        OfficialProvider(
            name: "anime sato",
            category: "youtube · canal oficial gratuito",
            detail: "Canal da distribuidora Sato Company. A grade é atualizada; resolução e idioma devem ser conferidos em cada vídeo.",
            url: URL(string: "https://www.youtube.com/@AnimeSatoOficial")!
        ),
        OfficialProvider(
            name: "anime sato · série em português",
            category: "youtube · playlist oficial · 12 episódios",
            detail: "With Vengeance, Sincerely, Your Broken Saintess. Playlist identificada no canal oficial; confirme disponibilidade e legendas em cada episódio.",
            url: URL(string: "https://www.youtube.com/playlist?list=PLe0jn-R7nFs4")!
        ),
        OfficialProvider(
            name: "muse br",
            category: "youtube · canal oficial",
            detail: "Canal oficial identificado. Nesta verificação não localizei playlist de episódios completos em português; mantido como canal de novidades, não como catálogo gratuito confirmado.",
            url: URL(string: "https://www.youtube.com/@musebrtv")!
        ),
        OfficialProvider(
            name: "pluto tv · anime",
            category: "canais ao vivo · grátis com anúncios",
            detail: "Categoria brasileira de canais de anime. Programação linear e catálogo mudam; não é um catálogo sob demanda completo.",
            url: URL(string: "https://pluto.tv/br/watch/live-tv/category/anime-geek-br/")!
        ),
        OfficialProvider(
            name: "crunchyroll brasil · youtube",
            category: "youtube · canal oficial",
            detail: "Canal oficial com trailers, clipes e episódios selecionados. A assinatura da plataforma não é gratuita no Brasil desde 2026.",
            url: URL(string: "https://www.youtube.com/@CrunchyrollBR")!
        ),
        OfficialProvider(
            name: "crunchyroll brasil · episódios completos",
            category: "youtube · playlist oficial · 227 vídeos listados",
            detail: "Playlist oficial com episódios completos selecionados. A própria descrição informa que temporadas completas estão na plataforma paga; nem todos os títulos ou episódios são gratuitos.",
            url: URL(string: "https://www.youtube.com/playlist?list=PLvdPoYtCK3rNsMQ4zL-OpuWd0cwKZqbSN")!
        ),
        OfficialProvider(
            name: "justwatch brasil",
            category: "busca de disponibilidade",
            detail: "Ajuda a localizar em qual serviço legal um título está disponível. Não hospeda nem reproduz episódios.",
            url: URL(string: "https://www.justwatch.com/br")!
        ),
        OfficialProvider(
            name: "manga plus",
            category: "mangá · serviço oficial da shueisha",
            detail: "Leitura oficial de mangás com capítulos gratuitos e opções pagas conforme a obra. Abre o serviço fora do ynoanimes.",
            url: URL(string: "https://mangaplus.shueisha.co.jp/")!
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "fontes"
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .always

        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(stack)

        stack.addArrangedSubview(YTheme.label("assista nas fontes oficiais", 22, .bold))
        stack.addArrangedSubview(YTheme.label(
            "Atalhos para fontes gratuitas e oficiais no Brasil. O ynoanimes abre cada serviço fora do app; não copia vídeos nem remove anúncios. A resolução máxima depende de cada título e ainda precisa ser conferida no serviço.",
            14, .regular, YTheme.muted
        ))

        for provider in providers {
            stack.addArrangedSubview(makeProviderCard(provider))
        }

        let note = YTheme.label(
            "A presença de um serviço nesta lista não significa que todo anime esteja disponível nele ou que exista autorização para incorporar seu player. A reprodução dentro do ynoanimes depende de contrato específico com o titular dos direitos.",
            12, .regular, YTheme.muted
        )
        stack.addArrangedSubview(note)

        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stack.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 18),
            stack.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -18),
            stack.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor, constant: -24)
        ])
    }

    private func makeProviderCard(_ provider: OfficialProvider) -> UIView {
        let card = YTheme.makeCard()
        let labels = UIStackView(arrangedSubviews: [
            YTheme.label(provider.name, 17, .semibold),
            YTheme.label(provider.category, 11, .semibold, YTheme.muted),
            YTheme.label(provider.detail, 13, .regular, YTheme.muted)
        ])
        labels.axis = .vertical
        labels.spacing = 7

        let button = ExternalProviderButton(title: "abrir fonte oficial ↗", destination: provider.url)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 42).isActive = true

        let content = UIStackView(arrangedSubviews: [labels, button])
        content.axis = .vertical
        content.spacing = 13
        content.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(content)

        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            content.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            content.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            content.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -16)
        ])
        return card
    }
}
