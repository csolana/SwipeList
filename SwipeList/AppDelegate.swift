//
//  AppDelegate.swift
//  SwipeList
//
//  Created by Carlos Solana on 11/21/18.
//  Copyright © 2018 Cybermoth. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do {
            _ = try Realm()
        } catch {
            print("Error initializing new realm \(error)")
        }

        return true
    }
    
}

