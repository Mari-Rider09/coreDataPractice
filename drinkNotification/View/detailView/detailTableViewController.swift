//
//  detailTableViewController.swift
//  drinkNotification
//
//  Created by Apple on 19/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class detailTableViewController: UITableViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var juiceDetailss: FavouriteJuices?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        lblName.text = juiceDetailss?.juiceName
        lblDescription.text = juiceDetailss?.juiceDescription
    }
    
    @IBAction func btnEdit(_ sender: Any) {
    }
}
