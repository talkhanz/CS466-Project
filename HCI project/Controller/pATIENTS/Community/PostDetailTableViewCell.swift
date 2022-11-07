//
//  PostDetailTableViewCell.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class PostDetailTableViewCell: UITableViewCell {

    @IBOutlet var profileIcon: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var likes: UILabel!
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
