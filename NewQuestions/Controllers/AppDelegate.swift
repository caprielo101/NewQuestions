//
//  AppDelegate.swift
//  NewQuestions
//
//  Created by Josiah Elisha on 26/04/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        //check if challenge exist
        let challenge = realm.objects(Challenges.self).first
        
        if challenge == nil {
            setupRealm()
        }
        
        let test = realm.objects(Tests.self).first
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController: UIViewController!
        
        //check if user already done test or not
        if test == nil {
            //go to intro page
            print("INTRO")
            
            nextViewController = storyboard.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
        }
        else {
            //go to dashboard
            print("DASHBOARD")
            nextViewController = storyboard.instantiateViewController(withIdentifier: "BottomSheetController") as! BottomSheetController
        }
        self.window?.rootViewController = nextViewController
        
        return true
    }

    func setupRealm() {
        let realm = try! Realm()
        //add challenge
        //4 6 8 breathing
        let challenge1 = Challenges()
        challenge1.id = 1
        challenge1.tiitle = "4-6-8 Breathing"
        challenge1.desc = """
        1. First, let your lips part. Make a whooshing sound, exhaling completely through your mouth.\n
        2. Next, close your lips, inhaling silently through your nose as you count to four in your head.\n
        3. Then, for seven seconds, hold your breath.\n
        4. Make another whooshing exhale from your mouth for eight seconds.
        """
        try! realm.write {
            //challenges
            realm.add(challenge1)
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

