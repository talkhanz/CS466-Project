//
//  DietCell.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class dietCell:UICollectionViewCell{
    
    @IBOutlet var quantitylabel: UILabel!
    @IBOutlet var dietImage: UIImageView!
    
    @IBAction func didChange(_ sender: Any) {
        quantitylabel.text = quantity.text
    }
    @IBOutlet var selectImage: UIImageView!
    @IBOutlet var quantity: UITextField!
}
