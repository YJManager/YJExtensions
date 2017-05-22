//
//  SubViewController.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2017/5/22.
//  Copyright © 2017年 Houmanager Author'email:houmanager@Hotmail.com. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    public var nameString = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameString = "HYJ"
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
