//
//  InstrumentsTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 28/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class InstrumentsTableViewCell: UITableViewCell {
    
    @IBOutlet var labelName:UILabel!
    @IBOutlet var buttonCheck:UIButton!
    @IBOutlet var imageInstruments:UIImageView!




    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
