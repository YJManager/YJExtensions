//
//  ViewController.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let name = "侯跃军是个天才"
        
        let namePinYin = name.yj_chineseTransform2PinYin(.firstLetter)
        
        print(namePinYin)
        
        let _ = UIStoryboard.yj_main.yj_loadViewController() as ViewController
        
        let vc = ViewController.yj_fromSB()
        print(vc)
        
        DispatchQueue.global().asyncAfter(delay: 2, execute:{
            print("延迟两秒执行")
        })
        
        DispatchQueue.global().asyncAfter(delay: .nanoseconds(10)) {
            print("延迟两纳秒执行")
        }

        
        let date = Date(string: "2013-10-24 12:24:56")
        
        _ = date?.add(2, .day)
        
        /**
         let version = Utils.appVersion
         Utils.appBuild
         
         let model = Utils.deviceUUID
         
         Utils.deviceModel
         
         let path = Path.applicationSupport().resource("data.Sqlite").string
         
         let obj = NSObject()
         
         class Task: NSObject, TaskProtocol {
         
         func cancel() {
         
         }
         }
         
         let task = Task()
         obj.record(task: task)
         
         let color = UIColor(hex: "0xaaddff")
         
         let action = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
         
         let date = Date()
         
         TimeZone(identifier: "Asia/Shanghai")
         
         date.add(1, .day).weekday
         
         let date2 = date.set(.hour, to: 0)
         date2.string()
         date2.unit(.day)
         
         date.withoutTime.string()
         date2.withoutTime
         
         date.weekday
         
         let duration = DateInterval(start: date2, end: date).duration
         */
        
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let subVc = SubViewController();
//        subVc.addObserver(self, forKeyPath: "nameString", options: .new, context: nil)
        subVc.yj_addSafeObserver(observer: self, forKeyPath: "nameString")
        navigationController?.pushViewController(subVc, animated: true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "nameString" {
            let nameString = change?[NSKeyValueChangeKey.newKey] as! String
            print("kvo-------: " + nameString)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

