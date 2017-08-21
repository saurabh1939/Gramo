//
//  MenuTableViewCell.swift
//  4sFoods
//
//  Created by Saurabh Singh Rathore on 21/06/16.
//  Copyright © 2016 wemo. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell
{
    @IBOutlet var imageVW : UIImageView!
    @IBOutlet var labelName : UILabel!
    @IBOutlet var labelLine : UILabel!
    @IBOutlet var viewBottom : UIView!
    @IBOutlet var buttonLogout:UIButton!
    


    
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
