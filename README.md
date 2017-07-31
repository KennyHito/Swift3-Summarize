概述
----------------

* 本工程主要是利用iOS 的Swift开发的技术要点汇总；
* 本人对Swift只是一枚菜鸟,有什么不对地方,可以指点;


要求
----------------

* iOS 8+
* Xcode 8.0+

期待
----------------

* 如果在使用过程中遇到BUG，希望你能[Issues](https://github.com/NSLog-YuHaitao/Swift3-Summarize/issues)我，谢谢(或者尝试下载最新的代码看看BUG修复没有)。
* 如果在使用过程中发现有更好或更巧妙的实用技术，希望你能[Issues](https://github.com/NSLog-YuHaitao/Swift3-Summarize/issues)我，我非常为该项目扩充更多好用的技术，谢谢。
* 如果通过该工程的使用，对您在开发中有一点帮助，码字不易，还请点击右上角star按钮，谢谢。


主要实现:
----------------
* 2017.07.20 基本框架的搭建,三方库的添加,这里找到了几个适合的三方库;

| 名称        | 三方库名  | 
| 网络请求     | Alamofire  |
| 下拉刷新        | ESPullToRefresh      |
| 网络图片加载        | Kingfisher      |
| 网络监听| ReachabilitySwift|

三方库的使用,目前是写到什么地方就会添加,所以会持续更新ing... 🏊🏊🏊🏊🏊🏊

* 2017.07.21

- 网络监听

~~~
// MARK: 
func checkNetwork() -> Void {
reachability.whenReachable = { reachability in
DispatchQueue.main.async {
if reachability.isReachableViaWiFi {
self.Hito.showAlert(viewController: (self.window?.rootViewController)!, title: "温馨提示", message: "当前网络是WiFi", time: 2.0)

} else {
self.Hito.showAlert(viewController: (self.window?.rootViewController)!, title: "温馨提示", message: "正在使用3G/4G网络!", time: 2.0)
}
}
}

reachability.whenUnreachable = {reachability in
DispatchQueue.main.async {
self.Hito.showAlert(viewController: (self.window?.rootViewController)!, title: "温馨提示", message: "当前网络无网络!", time: 2.0)
}
}

do{
try reachability.startNotifier()
} catch {
print("Unable to start notifier")
}
}
~~~
