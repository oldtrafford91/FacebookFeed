import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let feedViewController = FeedViewController(collectionViewLayout: UICollectionViewFlowLayout())
    let navigationController = UINavigationController(rootViewController: feedViewController)
    window?.rootViewController = navigationController
    setupNavigationBarAppearance()
    return true
  }
  
  fileprivate func setupNavigationBarAppearance() {
    UINavigationBar.appearance().barTintColor = UIColor.navigationBarTintColor
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navigationBarTitleTextColor]
  }
}

