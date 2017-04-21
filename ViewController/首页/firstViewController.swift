//
//  firstViewController.swift
//  SwiftDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import Alamofire
import Refresher
import ESPullToRefresh

class firstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    let arr : NSMutableArray = []
    var tableView : UITableView?
    let dataArr : NSMutableArray = []
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Back_Color
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        self.setUpData()
        self.setUpTableview()
        self.setRefresh()
    }
    
    // MARK: 刷新
    func setRefresh() -> Void{
        tableView?.es_addPullToRefresh {
            [weak self] in
            sleep(2)
            /// 在这里做刷新相关事件
            /// ...
            /// 如果你的刷新事件成功，设置completion自动重置footer的状态
            self?.tableView?.es_stopPullToRefresh(ignoreDate: true)
            /// 设置ignoreFooter来处理不需要显示footer的情况
            self?.tableView?.es_stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }
    
        
    }
    
    // MARK: 创建数据
    func setUpData() -> Void {
        for i in 1...30 {
            dataArr.add("第\(i)条数据")
        }
//        print(dataArr)
    }
    
    // MARK: 初始化(setup tableview)
    func setUpTableview() -> Void {
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: screen_width, height: screen_height-64-49))
        tableView?.backgroundColor = UIColor.white
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    
    }
    
    // MARK: cell的数量
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 30
    }
    
    // MARK: cell内容
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellID : String = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell==nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = dataArr[indexPath.row] as? String
        
        return cell!
    }
    
    // MARK: cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let xiangQ = XiangQingViewController()
        xiangQ.hidesBottomBarWhenPushed = true
        xiangQ.title = dataArr[indexPath.row] as? String
        self.navigationController?.pushViewController(xiangQ, animated: true)
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
