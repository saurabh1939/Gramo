//
//  MenuTableViewCell.swift
//  4sFoods
//
//  Created by SAMEER KHAN on 21/06/16.
//  Copyright © 2016 wemo. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell
{
    @IBOutlet var imageVW : UIImageView!
    @IBOutlet var labelName : UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
