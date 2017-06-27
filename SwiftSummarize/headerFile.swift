//
//  headerFile.swift
//  SwiftDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import Foundation

// MARK: 定义常量
public let screen_width = UIScreen.main.bounds.size.width
public let screen_height = UIScreen.main.bounds.size.height
public let Back_Color = UIColor.white
public let kApplication = UIApplication.shared.keyWindow
public let cellID : String = "cellID"

//设置颜色
public func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}


