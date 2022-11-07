//
//  viewDietViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class viewDietViewController:UIViewController{
    
    @IBOutlet var patName: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var time: UILabel!
    @IBOutlet var image: UIImageView!
  
    var Appointment : Appointments!

    override func viewDidLoad(){
        
     self.view.isUserInteractionEnabled = false
     topView.layer.borderWidth = 1
     topView.layer.borderColor = UIColor.lightGray.cgColor
 
        
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true

        
        //set data
       
        patName.text = Appointment.meeting_type
        date.text = Appointment.user_id
        time.text = Appointment.time
 
}
}


