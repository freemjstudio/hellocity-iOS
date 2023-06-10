import UIKit
import SnapKit

class BottomNavBar: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        tabBar.barTintColor = .white
        tabBar.tintColor = .black

    }
    func setupVCs() {
          viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "home_clicked")!),
            createNavController(for: SearchViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "search_unclicked")!)
          ]
        
      }
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 25, left: 10, bottom: 10, right: 10)
           rootViewController.navigationItem.title = title
           return navController
       }
    
}
