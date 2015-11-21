//
//  ViewController.swift
//  AddressBook
//
//  Created by xuzheng on 15/10/7.
//  Copyright © 2015年 xuzheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 定义一个存放联系人的容器
    var contactList: [Contact] = []
    
    // 实例化TableView
    let addressTableView: UITableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置当前视图的背景颜色和标题
        title = "通讯录"
        view.backgroundColor = UIColor.whiteColor()
        
        
        
        
        // 将TableView的代理设置为当前的视图控制器
        addressTableView.delegate = self
        addressTableView.dataSource = self
        
        // 将tableview添加到视图上
        view.addSubview(addressTableView)
        
       
        // 实例化系统的uibarbuttonItem
        let addBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addBarButtonAction")
        // 将实例化的barbutton添加到当前导航栏
        self.navigationItem.rightBarButtonItem = addBarButton
        
    }
    
    func addBarButtonAction() {
        
        // 实例化（添加视图控制器）
        let addViewController = AddViewController()
        
        addViewController.didContactCreateComplete = { (contact: Contact) -> Void in
            
            self.contactList += [contact]
            self.addressTableView.reloadData()
        }
        
        navigationController?.pushViewController(addViewController, animated: true)
        
    }
    
    
    
    
    // MARK: TableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count;
    }
    
    // MARK: TableView DataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        }
        let contact: Contact = contactList[indexPath.row]
        cell?.textLabel?.text = contact.name
        cell?.detailTextLabel?.text = contact.phone
        
        return cell!
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

