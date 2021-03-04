//
//  userDetailTableViewController.swift
//  drinkNotification
//
//  Created by Apple on 22/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class userDetailTableViewController: UITableViewController {

    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    var personDetail: Person?
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        lblEmail.text = personDetail?.email
        lblPassword.text = personDetail?.password
        if let age = personDetail?.age{
            lblAge.text = String(age)
        }
    }
    @IBAction func btnEdit(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "registerViewController") as! registerViewController
        vc.personDetail = self.personDetail
        vc.isUpdate = true
        vc.indexRow = self.indexRow
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
