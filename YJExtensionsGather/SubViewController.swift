//
//  SubViewController.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2017/5/22.
//  Copyright © 2017年 Houmanager Author'email:houmanager@Hotmail.com. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    dynamic var nameString = "houmanager"
    private var isSelected = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isSelected {
            nameString = "HYJ"
            isSelected = false
        }else{
            nameString = "YJManager"
            isSelected = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    deinit {
        print("Before + \(keyPathObservers)")
        yj_removeAllSafeObservers()
        print("After + \(keyPathObservers)")
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
