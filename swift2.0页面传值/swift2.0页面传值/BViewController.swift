//
//  BViewController.swift
//  swift2.0页面传值
//
//  Created by 康梁 on 16/1/10.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit

/**
 *    @author kl, 16-01-10 17:01:25
 *
 *    @brief 传值协议
 */
protocol passValueDelegate {
    func passValue(var text: String)
}

typealias nameValue = (String)->Void

class BViewController: UIViewController {
    // 1、声明属性
    var delegate: passValueDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var bNameTextField: UITextField!
    
    var nameText: nameValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bNameTextField.clearButtonMode = .WhileEditing
        self.textField.clearButtonMode = .WhileEditing
        
        // 注册为观察者，接收信息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "printName:", name: "name", object: nil)
    }
    
    @IBAction func buttonActive(sender: AnyObject) {
        // 2、调用代理方法，把值传输出去
        self.delegate?.passValue(textField.text!)
        
        // 使用闭包传值出去
        self.nameText!(self.bNameTextField.text!)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    /**
     收到广播后所执行的方法
     
     - parameter notifaction: notifaction
     */
    func printName(notifaction: NSNotification) {
        print(notifaction.object)
        self.bNameTextField.text = notifaction.object as? String
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // 闭包方法
    func returnNameValue(name: nameValue) {
        self.nameText = name
    }

    
}
