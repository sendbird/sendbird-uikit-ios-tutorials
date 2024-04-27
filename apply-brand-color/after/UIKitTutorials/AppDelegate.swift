//
//  AppDelegate.swift
//  UIKitTutorials
//
//  Created by Jerry Jeon on 2024/04/27.
//

import UIKit
import SendbirdUIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let APP_ID = "YOUR_APP_ID"    // TODO: Specify your Sendbird application ID.

        SendbirdUI.initialize(
            applicationId: APP_ID
        ) { params in
            // This is the builder block where you can modify the initParameter.
            //
            // [example]
            // params.needsSynchronous = false
        } startHandler: {
            // This is the origin.
            // Initialization of SendbirdUIKit has started.
            // We recommend showing a loading indicator once started.
        } migrationHandler: {
            // DB migration has started.
        } completionHandler: { error in
            // If DB migration is successful, proceed to the next step.
            // If DB migration fails, an error exists.
            // We recommend hiding the loading indicator once done.
        }
        
        SBUGlobals.currentUser = SBUUser(userId: "USER_ID") // TODO: Specify your user ID.
        
        
        SBUColorSet.primary100 = UIColor(red: 168/255, green: 226/255, blue: 171/255, alpha: 1)
        SBUColorSet.primary200 = UIColor(red: 105/255, green: 192/255, blue: 133/255, alpha: 1)
        SBUColorSet.primary300 = UIColor(red: 38/255, green: 156/255, blue: 114/255, alpha: 1)
        SBUColorSet.primary400 = UIColor(red: 2/255, green: 125/255, blue: 105/255, alpha: 1)
        SBUColorSet.primary500 = UIColor(red: 6/255, green: 104/255, blue: 88/255, alpha: 1)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

