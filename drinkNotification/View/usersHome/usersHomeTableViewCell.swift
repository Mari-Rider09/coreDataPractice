//
//  usersHomeTableViewCell.swift
//  drinkNotification
//
//  Created by Apple on 22/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class usersHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
