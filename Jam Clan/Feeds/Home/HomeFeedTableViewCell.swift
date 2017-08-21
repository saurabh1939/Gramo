//
//  HomeFeedTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 30/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionFeed: UICollectionView!
    @IBOutlet var imageProfile:UIImageView!
    @IBOutlet var labelName:UILabel!
    @IBOutlet var labelTime:UILabel!
    @IBOutlet var buttonMore:UIButton!





    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.registerNib()
    }
    
    func registerNib()
    {
        let nibNameCollectionCheck=UINib(nibName:"HomeFeedCollectionViewCell", bundle:nil)
        collectionFeed.register(nibNameCollectionCheck, forCellWithReuseIdentifier:"cell")
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
