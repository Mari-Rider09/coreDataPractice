//
//  favouriteTableViewCell.swift
//  drinkNotification
//
//  Created by Apple on 15/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class favouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var juiceImage: UIImageView!
    @IBOutlet weak var juiceName: UILabel!
    @IBOutlet weak var juiceDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
