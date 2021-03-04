//
//  registerViewController.swift
//  drinkNotification
//
//  Created by Apple on 09/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import CoreData

class registerViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
//    var people: [NSManagedObject] = []
    var personDetail: Person?
    var isUpdate = false
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtEmail.text = personDetail?.email
        txtPassword.text = personDetail?.password
        if let age = personDetail?.age {
            txtAge.text = String(age)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            btnSave.setTitle("Update", for: .normal)
        }else{
            btnSave.setTitle("Save", for: .normal)
        }
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let mail = txtEmail.text ?? " "
        let passwd = txtPassword.text ?? " "
        let age = txtAge.text ?? " "
        
        let dict = ["email" :mail,"password": passwd,"age": age]
        
        
        if isUpdate{
            DataBaseHelper.sharedInstance.editUserData(dict: dict, index: indexRow)
        }else{
            DataBaseHelper.sharedInstance.saveData(dataDict: dict)
        }
    }
    
}
