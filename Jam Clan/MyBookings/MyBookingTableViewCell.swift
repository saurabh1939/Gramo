//
//  MyBookingTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 13/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MyBookingTableViewCell: UITableViewCell {
    @IBOutlet var imageEvent : UIImageView!
    @IBOutlet var labelEventname : UILabel!
    @IBOutlet var labelDate : UILabel!
    @IBOutlet var labelTime : UILabel!
    @IBOutlet var labelBookingid : UILabel!
    @IBOutlet var buttonCancel : UIButton!
    
    @IBOutlet var viewOwnerBottom : UIView!
    @IBOutlet var buttonOwnerCancel : UIButton!
    @IBOutlet var buttonOwnerTickets : UIButton!
    @IBOutlet var buttonOwnerAccept : UIButton!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
