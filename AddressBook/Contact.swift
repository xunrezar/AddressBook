//
//  Contact.swift
//  AddressBook
//
//  Created by xuzheng on 15/10/7.
//  Copyright © 2015年 xuzheng. All rights reserved.
//

import Foundation

// 定义一个用来存储联系人的类。
class Contact {
    
    // 姓名
    var name: String?
    // 电话
    var phone: String?
    // 头像图片
    var headerImageString: String?
    
    // Contact类的Init构造方法
    init(name: String, phone: String, headerImageString: String) {
        
        self.name = name
        self.phone = phone
        self.headerImageString = headerImageString
    }
}
