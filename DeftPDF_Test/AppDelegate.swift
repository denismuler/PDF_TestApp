//
//  AppDelegate.swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 05.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = TabBar()
        window?.rootViewController = home
        window?.makeKeyAndVisible()
        
        return true
    }
}
