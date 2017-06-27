//
//  AppDelegate.swift
//  SwiftSummarize
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import ReachabilitySwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let reachability = Reachability()!
    let Hito = HitoAlert()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        var vcArr = [firstViewController(),secondViewController(),thirdViewController(),MeTableViewController()];
        let titleArr = ["首页","二维码","购物车","个人中心"]
        let imageNormalArr = ["b1-1","b3-3","b4-4","b5-5"]
        let imageSelectArr = ["b1","b3","b4","b5"]
        let tab = UITabBarController.init()
        for i in 0...vcArr.count-1{
            let vc : UIViewController = vcArr[i]
            
            vc.tabBarItem.image = UIImage.init(named: imageNormalArr[i])?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            vc.tabBarItem.selectedImage = UIImage.init(named: imageSelectArr[i])?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            vc.title = titleArr[i]
            
            let nav = UINavigationController.init(rootViewController: vc)
            
            //统一设置导航栏背景色
            nav.navigationBar.barTintColor = RGBCOLOR(r: 118, 190, 14)
            //统一设置导航栏字体颜色
            nav.navigationBar.titleTextAttributes =
                [NSForegroundColorAttributeName: UIColor.white]
            
            vcArr[i] = nav
        }
        tab.viewControllers = vcArr
        tab.tabBar.tintColor = UIColor.init(colorLiteralRed: 118/255.0, green: 190/255.0, blue: 14/255.0, alpha: 1)
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
        
        
        reachability.whenReachable = { reachability in
            DispatchQueue.main.async {
                if reachability.isReachableViaWiFi {
                    self.Hito.showAlert(viewController: (self.window?.rootViewController)!, title: "温馨提示", message: "当前网络是WiFi", time: 2.0)
//                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
            }
        }
        
        reachability.whenUnreachable = {reachability in
            DispatchQueue.main.async {
                self.Hito.showAlert(viewController: (self.window?.rootViewController)!, title: "温馨提示", message: "当前网络无网络!", time: 2.0)
//                print("Not reachable")
            }
        }
        
        do{
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        // 检测网络类型
        if reachability.isReachableViaWiFi {
            print("网络类型：Wifi")
        } else if reachability.isReachableViaWWAN {
            print("网络类型：移动网络")
        } else {
            print("网络类型：无网络连接")
        }
        
        // MARK: 统一设置一些方法
//        UINavigationBar.appearance()
        
        
        return true
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

