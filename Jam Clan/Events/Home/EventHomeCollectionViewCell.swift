//
//  EventHomeCollectionViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 01/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class EventHomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var labelName:UILabel!
    @IBOutlet var labelBy:UILabel!
    @IBOutlet var labelDistance:UILabel!
    @IBOutlet var labelRating:UILabel!
    @IBOutlet var imageItem:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
