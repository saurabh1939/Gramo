//
//  HistoryTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 13/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet var imageTopLine:UIImageView!
    @IBOutlet var imageDot:UIImageView!
    @IBOutlet var imageBottomLine:UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
