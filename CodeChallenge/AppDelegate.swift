//
//  AppDelegate.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let moviesListViewController = MoviesListViewController()
        let navigation = UINavigationController(rootViewController: moviesListViewController)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        return true
    }

}

