//
//  logRegViewController.swift
//  drinkNotification
//
//  Created by Apple on 09/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class logRegViewController: UIViewController {

    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var registerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func segmentedSelectedActiom(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 1:
            loginView.isHidden = false
            registerView.isHidden = true
            break
        case 0:
            loginView.isHidden = true
            registerView.isHidden = false
            break
        default:
            break
        }
    }
}
