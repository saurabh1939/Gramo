//
//  MusicPlayerTableViewCell.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MusicPlayerTableViewCell: UITableViewCell {

    @IBOutlet var imageSong:UIImageView!
    @IBOutlet var labelSongName:UILabel!
    @IBOutlet var labelSongArtist:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
