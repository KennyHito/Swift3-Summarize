//
//  BaseTabBarController.swift
//  SwiftSummarize
//
//  Created by Apple on 2017/7/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var vcArr = [firstViewController(),secondViewController(),thirdViewController(),MeTableViewController()];
        let titleArr = ["首页","分类","社区","我的"]
        let imageNormalArr = ["b1-1","b3-3","b4-4","b5-5"]
        let imageSelectArr = ["b1","b3","b4","b5"]
        
        for i in 0...vcArr.count-1{
            let vc : UIViewController = vcArr[i]
            
            vc.tabBarItem.image = UIImage.init(named: imageNormalArr[i])?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            vc.tabBarItem.selectedImage = UIImage.init(named: imageSelectArr[i])?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            vc.title = titleArr[i]
            
            let nav = BaseNavigationController.init(rootViewController: vc)
            
            vcArr[i] = nav
        }
        self.viewControllers = vcArr
        self.tabBar.tintColor = UIColor.init(colorLiteralRed: 118/255.0, green: 190/255.0, blue: 14/255.0, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
