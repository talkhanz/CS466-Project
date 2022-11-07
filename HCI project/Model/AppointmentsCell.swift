//
//  AppointmentsCell.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/23/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class AppointmentsCell:UITableViewCell{
    

    @IBOutlet var view: UIView!
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var date: UILabel!
    @IBOutlet var day: UILabel!
    @IBOutlet var patientName: UILabel!
    @IBOutlet var time: UILabel!
}
