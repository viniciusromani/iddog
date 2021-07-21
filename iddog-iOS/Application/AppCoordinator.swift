import UIKit

final class AppCoordinator {
    private weak var window: UIWindow?
    private let userCache: UserCache
    
    init (window: UIWindow?) {
        self.window = window
        let dataSource = UserDefaultsCache(dataSource: UserDefaults.standard)
        self.userCache = UserCache(cache: dataSource)
    }

    func start() {
        let viewModel = SignUpViewModel(cache: self.userCache)
        let signUpViewController = SignUpViewController(viewModel: viewModel)
        
        viewModel.view = signUpViewController
        signUpViewController.delegate = self
        
        window?.rootViewController = signUpViewController
        window?.makeKeyAndVisible()
    }
}

extension AppCoordinator: SignUpViewControllerDelegate {
    func signUpViewControllerDidSignUp(_ viewController: SignUpViewController) {
        UIView.transition(
            with: window!,
            duration: 0.5,
            options: [.transitionFlipFromLeft],
            animations: {
                let viewModel = FeedViewModel(cache: self.userCache)
                let viewController = FeedViewController(viewModel: viewModel)
                viewModel.view = viewController
                let navigationController = UINavigationController(rootViewController: viewController)
                navigationController.navigationBar.prefersLargeTitles = true
                self.window?.rootViewController = navigationController
            }
        )
    }
}
