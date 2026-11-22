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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .never

        let scroll = UIScrollView()
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 22
        stack.translatesAutoresizingMaskIntoConstraints = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        scroll.addSubview(stack)

        let brand = UIStackView(arrangedSubviews: [
            YTheme.label("yno animes", 30, .bold),
            YTheme.label("anime e mangá, do seu jeito.", 14, .regular, YTheme.muted)
        ])
        brand.axis = .vertical
        brand.spacing = 4
        stack.addArrangedSubview(brand)

        let hero = YTheme.makeCard()
        let heroStack = UIStackView(arrangedSubviews: [
            YTheme.label("sua próxima história", 11, .bold, YTheme.muted),
            YTheme.label("tudo começa\npor aqui.", 32, .bold),
            YTheme.label("Um espaço para descobrir, acompanhar e guardar seus animes e mangás.", 14, .regular, YTheme.muted),
            YTheme.label("catálogo não conectado", 12, .semibold, YTheme.muted)
        ])
        heroStack.axis = .vertical
        heroStack.spacing = 14
        heroStack.translatesAutoresizingMaskIntoConstraints = false
        hero.addSubview(heroStack)
        NSLayoutConstraint.activate([
            heroStack.topAnchor.constraint(equalTo: hero.topAnchor, constant: 22),
            heroStack.leadingAnchor.constraint(equalTo: hero.leadingAnchor, constant: 20),
            heroStack.trailingAnchor.constraint(equalTo: hero.trailingAnchor, constant: -20),
            heroStack.bottomAnchor.constraint(equalTo: hero.bottomAnchor, constant: -22)
        ])
        stack.addArrangedSubview(hero)

        stack.addArrangedSubview(YTheme.label("continue explorando", 18, .semibold))
        let info = YTheme.makeCard()
        let infoStack = UIStackView(arrangedSubviews: [
            YTheme.label("◇", 24, .medium, YTheme.muted),
            YTheme.label("um catálogo, sem atalhos duvidosos.", 15, .semibold),
            YTheme.label("A ligação com uma fonte autorizada ainda está pendente. Nenhum título fictício será apresentado como catálogo real.", 13, .regular, YTheme.muted)
        ])
        infoStack.axis = .vertical
        infoStack.spacing = 10
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        info.addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: info.topAnchor, constant: 18),
            infoStack.leadingAnchor.constraint(equalTo: info.leadingAnchor, constant: 18),
            infoStack.trailingAnchor.constraint(equalTo: info.trailingAnchor, constant: -18),
            infoStack.bottomAnchor.constraint(equalTo: info.bottomAnchor, constant: -18)
        ])
        stack.addArrangedSubview(info)

        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stack.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: scroll.frameLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: scroll.frameLayoutGuide.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}

final class SearchScreen: UIViewController, UITextFieldDelegate {
    private let field = UITextField()
    private let feedback = YTheme.label("A busca será ativada quando uma fonte de catálogo autorizada for configurada.", 14, .regular, YTheme.muted)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "buscar"
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .always
        field.placeholder = "nome do anime ou mangá"
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
        feedback.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [field, feedback])
        stack.axis = .vertical
        stack.spacing = 22
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
        guard let query = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !query.isEmpty else { return true }
        UnconfiguredCatalogProvider().searchAnime(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let items): self?.feedback.text = "\(items.count) resultado(s)."
                case .failure(.providerNotConfigured):
                    self?.feedback.text = "A fonte de catálogo ainda não foi conectada. A busca não consulta serviços não autorizados."
                case .failure(.unavailable):
                    self?.feedback.text = "O catálogo está temporariamente indisponível."
                }
            }
        }
        return true
    }
}

final class LibraryScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "biblioteca"
        view.backgroundColor = YTheme.bg
        navigationItem.largeTitleDisplayMode = .always
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.subviews.forEach { $0.removeFromSuperview() }
        let favorites = LibraryStore.shared.favoriteIDs().count
        let progress = LibraryStore.shared.allProgress().count
        let symbol = UIImageView(image: UIImage(systemName: "bookmark"))
        symbol.tintColor = YTheme.muted
        symbol.translatesAutoresizingMaskIntoConstraints = false
        let summary = YTheme.label("Seus dados ficam neste aparelho.\n\n\(favorites) favorito(s)\n\(progress) episódio(s) com progresso", 14, .regular, YTheme.muted)
        summary.textAlignment = .center
        summary.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(symbol)
        view.addSubview(summary)
        NSLayoutConstraint.activate([
            symbol.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            symbol.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -55),
            symbol.widthAnchor.constraint(equalToConstant: 34),
            symbol.heightAnchor.constraint(equalToConstant: 34),
            summary.topAnchor.constraint(equalTo: symbol.bottomAnchor, constant: 22),
            summary.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            summary.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28)
        ])
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

/// Must be created only by an integration that has verified the right to provide this media.
struct PlayableMedia {
    let url: URL
    let title: String
    let episodeTitle: String

    init?(url: URL, title: String, episodeTitle: String) {
        guard url.scheme?.lowercased() == "https" else { return nil }
        self.url = url
        self.title = title
        self.episodeTitle = episodeTitle
    }
}

final class PlaybackScreen: AVPlayerViewController {
    init(media: PlayableMedia) {
        super.init(nibName: nil, bundle: nil)
        player = AVPlayer(url: media.url)
        title = media.title
        navigationItem.prompt = media.episodeTitle
        player?.allowsExternalPlayback = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) não é suportado") }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player?.pause()
    }
}
