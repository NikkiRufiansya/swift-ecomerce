import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        clearCartForUITest()
        showJailbreakAlert()
        let startCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
    
    // MARK: - Private Methods
    private func clearCartForUITest () {
        let arguments = CommandLine.arguments
        if arguments.contains("resetCart") {
            CartHelper.clearCart()
        }
    }
    
    func showJailbreakAlert() {
        if detectionJailbreak {
            let alertController = UIAlertController(
                title: "Warning",
                message: "Jailbroken device detected. This app may not function properly on jailbroken devices.",
                preferredStyle: .alert
            )
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                exit(0)
            }
            window.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
}
