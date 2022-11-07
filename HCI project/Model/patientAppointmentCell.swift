//
//  patientAppointmentCell.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class patientAppointmentCell:UITableViewCell{
    

    @IBOutlet var view: UIView!
    
    @IBOutlet var date: UILabel!
    @IBOutlet var day: UILabel!
    @IBOutlet var patientName: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var reason: UILabel!
}
