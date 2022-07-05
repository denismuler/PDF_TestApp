//
//  TabBarViewController .swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 05.07.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs(){
        viewControllers = [
            createNavController(for: ViewController(), title: NSLocalizedString ("File", comment: ""),
                                image: UIImage(named: "files")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Tools", comment: ""),
                                image: UIImage(named: "tools")!),
            createNavController(for: ViewController(), title: NSLocalizedString( "Account", comment: ""),
                                image: UIImage (named: "account")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles=true
        rootViewController.navigationItem.title=title
        return navController
    }
}
