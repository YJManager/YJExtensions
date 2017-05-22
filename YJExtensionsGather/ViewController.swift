//
//  ViewController.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/11/16.
//  Copyright © 2016年 Houmanager Author'email:houmanager@Hotmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let subVc = SubViewController();
        subVc .yj_addSafeObserver(observer: self, forKeyPath: "nameString")
        navigationController?.pushViewController(subVc, animated: true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let nameString = change?[NSKeyValueChangeKey.newKey]
        print(nameString ?? "---------")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

