//
//  HomeStudiosTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 27/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class HomeStudiosTableViewCell: UITableViewCell {
    
    @IBOutlet var labelName:UILabel!
    @IBOutlet var labelInstruments:UILabel!
    @IBOutlet var labelTime:UILabel!
    @IBOutlet var labelPrice:UILabel!
    @IBOutlet var labelRating:UILabel!
    @IBOutlet var imageItem:UIImageView!






    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
