//
//  AppDelegate.swift
//  UI Examples
//
//  Created by Ben Guo on 7/18/17.
//  Copyright © 2017 Stripe. All rights reserved.
//

import Firebase
import UIKit
import Stripe

import UserNotifications
import FirebaseInstanceID
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate{
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        //        let rootVC = BrowseViewController()
        //        let navController = UINavigationController(rootViewController: rootVC)
        //        let window = UIWindow(frame: UIScreen.main.bounds)
        //        window.rootViewController = navController
        //        window.makeKeyAndVisible()
        //        self.window = window
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        
        FirebaseApp.configure()
        return true
    }
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
    }
    
}

