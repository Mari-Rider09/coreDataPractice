//
//  collegeViewController.swift
//  drinkNotification
//
//  Created by Apple on 02/03/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class collegeViewController: UIViewController {

    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnSave(_ sender: Any) {
        guard let adres = txtAddress.text else{return}
        guard let city = txtCity.text else{return}
        guard let name = txtName.text else{return}
        guard let uni = txtUniversity.text else {return}
        
        let dict = ["address": adres,"city": city,"name": name,"university": uni]
        DataBaseHelper.sharedInstance.saveCollegeDetail(saveDict: dict)
    }
    
}
