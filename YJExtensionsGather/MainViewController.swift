//
//  MainViewController.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

class MainViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = .red
        
        testFunc()
        
        let dateString = "2017/12/10 11:25:32"
        let date = Date(string: dateString);
        
        if let date = date {
            print(date)
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = SubViewController()
        navigationController?.push(vc)
        
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        navigationController?.push(vc)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension MainViewController {

    func testFunc() {
        
        print(self)
        //获取命名空间，在info.plist文件里就是Executable file
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        print("nameSpace->" + nameSpace)
    }
}
