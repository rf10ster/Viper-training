import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let router = Router(rootController: rootController)
        let listModule = MoviesListModuleBuilder().build(with: router)
        router.setRootModule(listModule)
        return true
    }
}
