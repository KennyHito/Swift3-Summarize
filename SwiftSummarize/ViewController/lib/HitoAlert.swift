//
//  HitoAlert.swift
//  SwiftSummarize
//
//  Created by Apple on 2017/3/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class HitoAlert: NSObject {

    let alert : UIAlertView = UIAlertView()
    
    func showAlert(viewController : UIViewController,title : String,message : String,time : TimeInterval) -> Void {
        
        let alert : UIAlertController = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        viewController.present(alert, animated: true, completion: nil)
        self.perform(#selector(HitoAlert.dismissAlert), with: alert, afterDelay: time)
    }
    
    func dismissAlert(alert : UIAlertController) -> Void {
        alert.dismiss(animated: true, completion: nil)
    }
    
    
    
}
