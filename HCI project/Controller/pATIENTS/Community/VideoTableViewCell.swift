//
//  VideoTableViewCell.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet var playbtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var title: UILabel!
    @IBOutlet var likes: UILabel!
    
    @IBOutlet var videoimage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
