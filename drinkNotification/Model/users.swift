//
//  users.swift
//  drinkNotification
//
//  Created by Apple on 15/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class users: NSObject {

    var age = Int()
    var password = String()
    var email = String()
    
    init(age: Int,password: String,email: String) {
        self.age = age
        self.password = password
        self.email = email
    }
    
    override init() {
        self.age = 0
        self.password = " "
        self.email = " "
    }
}
var person = [users]()
