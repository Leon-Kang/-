//
//  AViewController.swift
//  swift2.0页面传值
//
//  Created by 康梁 on 16/1/10.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit

class AViewController: UIViewController, passValueDelegate // 1、遵守协议
{
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.clearButtonMode = .WhileEditing
    }
    

    
    @IBAction func buttonAction(sender: AnyObject) {
        let bVC = BViewController()
        
        // 取到闭包传递的值
        bVC.returnNameValue { (name) -> Void in
            self.nameTextField.text = name
        }
        
        // 2、设置代理
        bVC.delegate = self
        
        self.presentViewController(bVC, animated: true, completion: nil)
        
        // 发出广播
        NSNotificationCenter.defaultCenter().postNotificationName("name", object: self.nameTextField.text)
    }
    
    // 3、重写协议方法，取到传值
    func passValue(text: String) {
        textLabel.text = text
    }
    

}
