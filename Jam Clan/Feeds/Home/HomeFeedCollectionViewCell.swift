//
//  HomeFeedCollectionViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 30/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class HomeFeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var buttonLike:UIButton!
    @IBOutlet var buttonLikeCounts:UIButton!
    @IBOutlet var buttonComment:UIButton!
    @IBOutlet var buttonCommentCounts:UIButton!
    @IBOutlet var buttonShare:UIButton!
    @IBOutlet var buttonShareCounts:UIButton!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
