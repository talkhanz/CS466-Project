//
//  CommunityViewCell.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit
class CommunityTableViewCell: UITableViewCell {
    
    @IBOutlet var communityImage: UIImageView!
    @IBOutlet var joinedButton: UIButton!
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView?.layer.cornerRadius = 32
        imageView?.layer.borderWidth = 1
        
        communityImage.layer.masksToBounds = false
       communityImage.layer.borderColor = UIColor.lightGray.cgColor
       communityImage.layer.cornerRadius = communityImage.frame.height/2
        communityImage.clipsToBounds = true
       
    }
    
    func setupcell(isHideJoin: Bool) {
        
        joinedButton.isHidden = isHideJoin
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func joinedTapped(_ sender: UIButton) {
        joinedButton.isSelected = !joinedButton.isSelected
    }
}

