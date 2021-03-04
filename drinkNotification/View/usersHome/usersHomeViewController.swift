//
//  usersHomeViewController.swift
//  drinkNotification
//
//  Created by Apple on 22/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class usersHomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var userData = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        userData = DataBaseHelper.sharedInstance.getUserData()
        self.tableView.reloadData()
    }
}
extension usersHomeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! usersHomeTableViewCell
        cell.lblEmail.text = userData[indexPath.row].email
        cell.lblPassword.text = userData[indexPath.row].password
        cell.lblAge.text = String(userData[indexPath.row].age)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "userDetail") as! userDetailTableViewController
        vc.personDetail = userData[indexPath.row]
        vc.indexRow = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
        UITableView.automaticDimension
    }
}
