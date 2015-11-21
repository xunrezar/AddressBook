//
//  AddViewController.swift
//  AddressBook
//
//  Created by xuzheng on 15/10/7.
//  Copyright © 2015年 xuzheng. All rights reserved.
//

import UIKit


class AddViewController: UIViewController {
    
    var nameField: UITextField?
    var phoneField: UITextField?
    
    // 定义一个的闭包，用来传递Contact参数
    var didContactCreateComplete: ((contact: Contact) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "添加联系人"
        view.backgroundColor = UIColor.whiteColor()
        
        // 实例化自定义的uibutton
        let headerButton = UIButton(type: UIButtonType.Custom)
        headerButton.frame = CGRectMake(20, 84, 120, 120)
        headerButton.layer.masksToBounds = true
        headerButton.layer.cornerRadius = 60
        headerButton.setBackgroundImage(UIImage(named: "header"), forState: UIControlState.Normal)
        view.addSubview(headerButton)
        
        
        nameField = UITextField(frame: CGRectMake(160, 84, kScreenWidth - 180, 30))
        nameField!.placeholder = "姓名"
        nameField!.borderStyle = UITextBorderStyle.RoundedRect
        view.addSubview(nameField!)
        
        
        phoneField = UITextField(frame: CGRectMake(160, 124, kScreenWidth - 180, 30))
        phoneField!.placeholder = "手机"
        phoneField!.borderStyle = UITextBorderStyle.RoundedRect
        view.addSubview(phoneField!)
        
        let addButton: UIButton = UIButton(type: UIButtonType.Custom)
        addButton.frame = CGRectMake(160, 164, kScreenWidth - 180, 30)
        addButton.setTitle("确认", forState: UIControlState.Normal)
        addButton.titleLabel?.font = UIFont.boldSystemFontOfSize(17)
        addButton.backgroundColor = UIColor.orangeColor()
        addButton.addTarget(self, action: "addButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(addButton)
        
    }

    func addButtonAction(sender: UIButton) {

        // 如果名字或者号码缺失
        if (nameField?.text == "") || (phoneField?.text == "") {
            
            // 实例化AlertController对象
            let alertController: UIAlertController = UIAlertController(title: "提示", message: "姓名或号码为空", preferredStyle: UIAlertControllerStyle.Alert)
            
            // 实例化AlertAction对象
            let alertAction: UIAlertAction = UIAlertAction(title: "好", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                
            })
            // 将AlertAction添加到AlertController上
            alertController.addAction(alertAction)
            
            // 模态出AlertController
            navigationController?.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            
            
            let contact: Contact = Contact(name: nameField!.text!, phone: phoneField!.text!, headerImageString: "header")
            
            if didContactCreateComplete != nil {
                didContactCreateComplete!(contact: contact)
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
//        nameFields
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
