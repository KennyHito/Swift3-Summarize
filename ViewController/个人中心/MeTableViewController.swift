//
//  MeTableViewController.swift
//  SwiftSummarize
//
//  Created by 于海涛 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class MeTableViewController: UITableViewController {

    var iv : UIImageView = UIImageView()
    var dataArr : NSMutableArray = NSMutableArray()
    var str : String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Back_Color
        self.navigationItem.title = ""
       
        self.setUpDataArr()
        self.setupUI()
    }
    
    
    func setUpDataArr() -> Void {
        
        dataArr = ["我的博客","我的微博","我的GitHub","我的简书","我的设备","夜间模式","清除缓存","反馈信息","联系我们"]
    }
    
    func setupUI() -> Void {
        //背景图
        iv = UIImageView.init(frame: CGRect.init(x: 0, y: -200, width: Int( screen_width), height: 200))
        iv.image = UIImage.init(named: "烟花.jpg")
        iv.contentMode = UIViewContentMode.scaleAspectFill
        iv.clipsToBounds = true
        self.tableView.addSubview(iv)
        self.tableView.contentInset = UIEdgeInsets.init(top: 200, left: 0, bottom: 0, right: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID : String = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell==nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = dataArr[indexPath.row] as? String
        
        if indexPath.row == 5{
            let sw : UISwitch = UISwitch.init(frame: CGRect.init(x: 50, y: 50, width: 100, height: 50))
            sw.tag = 1000
            sw.setOn(false, animated: true)
            sw.addTarget(self, action: #selector(MeTableViewController.changeEvent), for: UIControlEvents.valueChanged)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.accessoryView = sw
            
        }else if indexPath.row == 6 {
            
            let clear = ClearCache.init()
            let lab : UILabel = UILabel.init(frame: CGRect.init(x: 100, y: 50, width: 100, height: 50))
            str = String.init("已使用\(clear.fileSizeOfCache())M")
            lab.font = UIFont.systemFont(ofSize: 14)
            lab.textAlignment = NSTextAlignment.right
            lab.text = str
            cell?.accessoryView = lab
            
        }
        
        return cell!
    }
    
    // MARK: UISwitch开关按钮事件实现
    func changeEvent() -> Void {
        let sw : UISwitch = self.view.viewWithTag(1000) as! UISwitch
        var flag : Bool = false
        flag = !flag
        if sw.isOn&&flag{
            self.view.window?.backgroundColor = UIColor.black
            self.view.window?.alpha = 0.8
        }else{
            self.view.window?.backgroundColor = UIColor.white
            self.view.window?.alpha = 1.0
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offSet : Float = Float(scrollView.contentOffset.y)
        if offSet < -200 {
            var rect = iv.frame
            rect.origin.y = CGFloat(offSet)
            rect.size.height = -(CGFloat)(offSet)
            iv.frame = rect
        }
        
    }
    
    // MARK: cell点击事件
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            //我的博客
            self.openFuncCommd(str: "https://nslog-yuhaitao.github.io/")
            
        }else if indexPath.row == 1 {
            //我的微博
            self.openFuncCommd(str: "http://weibo.com/KennyHito");
        
        }else if indexPath.row == 2 {
            //我的Github
            self.openFuncCommd(str: "https://github.com/NSLog-YuHaitao?tab=repositories");
            
        }else if indexPath.row == 3 {
            //我的简书
            self.openFuncCommd(str: "http://www.jianshu.com/users/c3dc9c3117a5/latest_articles")
        
        }else if indexPath.row == 4 {
            //我的设备
            
            
        }else if indexPath.row == 5 {
            //夜间模式
            
        
        }else if indexPath.row == 6 {
            //清楚缓存
            
        
        }else if indexPath.row == 7 {
            //反馈信息
            self.openFuncCommd(str: "mailto://yht1154180808@163.com")
        
        }else if indexPath.row == 8 {
            //联系我们
            self.openFuncCommd(str: "telprompt://13522131242")//自带弹出提示框
        }
    }
    
    // MARK: 跳转的方法
    func openFuncCommd(str : String) -> Void {
        let url : URL = URL(string:str)!
        let app : UIApplication = UIApplication.shared
        if app.canOpenURL(url) {
            app.openURL(url)
        }else{
            print("没有此功能或者该功能不可用")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
