//
//  PostSomethingTableViewCell.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class PostSomethingTableViewCell: UITableViewCell {

    @IBOutlet var textView: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textView.placeholder = "Post Something"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

