//
//  SettingsTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 12/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet var imageArrow:UIImageView!
    @IBOutlet var switchPush:UISwitch!
    @IBOutlet var labelName:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
