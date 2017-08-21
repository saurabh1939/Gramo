//
//  MyFeedsTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/06/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MyFeedsTableViewCell: UITableViewCell {
    
    @IBOutlet var buttonLike:UIButton!
    @IBOutlet var buttonLikeCounts:UIButton!
    @IBOutlet var buttonComment:UIButton!
    @IBOutlet var buttonCommentCounts:UIButton!
    @IBOutlet var buttonShare:UIButton!
    @IBOutlet var buttonShareCounts:UIButton!
    
    @IBOutlet var imageProfile:UIImageView!
    @IBOutlet var labelName:UILabel!
    @IBOutlet var labelTime:UILabel!
    @IBOutlet var buttonMore:UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
