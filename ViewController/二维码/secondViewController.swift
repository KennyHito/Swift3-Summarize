//
//  secondViewController.swift
//  SwiftDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import Kingfisher

class secondViewController: UIViewController {

    var scrollView : UIScrollView = UIScrollView()
    var dataArr : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Back_Color
        self.automaticallyAdjustsScrollViewInsets = false
        
       
    }
    
    // MARK: 初始化数据
    func setUpData() -> Void {
        let arr : NSArray = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490935382589&di=aabb7bc7f0b1e427078e124d1cc7d62f&imgtype=0&src=http%3A%2F%2Fp1.gexing.com%2Fshaitu%2F20130517%2F0141%2F51951a38ce5f4.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490935403701&di=27782fa620d70d06bf586265c0982808&imgtype=0&src=http%3A%2F%2Fp4.gexing.com%2Fshaitu%2F20130517%2F0142%2F51951a8469adc.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491530193&di=30fac5de32685c1af4f2acef36020ef5&imgtype=jpg&er=1&src=http%3A%2F%2Fp4.gexing.com%2Fshaitu%2F20130428%2F2042%2F517d191a2e1dc.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1490925408&di=89b5d39b35519a16ea1bf0b481b6d904&src=http://img2.3lian.com/2014/f2/157/d/86.jpg"]
        
        dataArr = NSMutableArray.init(array: arr)
        
    }
    
    //创建ScrollView
    func setScrollView() -> Void {
        
        scrollView = UIScrollView.init(frame: CGRect.init(x:0, y:64, width:screen_width, height:200))
        
        scrollView.backgroundColor = UIColor.white
        //设置大小
        scrollView.contentSize = CGSize.init(width: screen_width*4, height: 0)
        //弹性
        scrollView.bounces = true
        //分页
        scrollView.isPagingEnabled = true
        //取消水平滚动条
        scrollView.showsHorizontalScrollIndicator = false
        //取消垂直滚动条
        scrollView.showsVerticalScrollIndicator = false;
        
        self.view.addSubview(scrollView)
    }
    
    // 加载数据
    func displayData() -> Void {
        for i in 0..<dataArr.count {
            let iv : UIImageView = UIImageView.init(frame: CGRect.init(x: Int(screen_width)*i , y: 0, width: Int(screen_width), height: 200))

            let url = URL(string: dataArr[i] as! String)
            iv.kf.setImage(with: url)
            scrollView.addSubview(iv)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUpData()
        self.setScrollView()
        self.displayData()
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
