//
//  AppDelegate.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        customizeAppearance()
        return true
    }
    
    func customizeAppearance() {
        window?.tintColor = UIColor.appDefault
    }
    
}

