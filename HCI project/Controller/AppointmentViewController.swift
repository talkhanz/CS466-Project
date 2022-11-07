//
//  AppointmentViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class AppointmentViewController:UIViewController{
    
    @IBOutlet var patName: UILabel!
    
    @IBOutlet var bottomview: UIView!
    @IBOutlet var date: UILabel!
    
    @IBOutlet var reason: UITextField!
    @IBOutlet var topView: UIView!
    @IBOutlet var time: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var hospitalname: UITextField!
    var Appointment : Appointments!
   
    
        override func viewDidLoad(){
            
         self.view.isUserInteractionEnabled = false
         topView.layer.borderWidth = 1
         topView.layer.borderColor = UIColor.lightGray.cgColor
         bottomview.layer.borderWidth = 1
         bottomview.layer.borderColor = UIColor.lightGray.cgColor
            
            image.layer.borderWidth = 1
            image.layer.masksToBounds = false
            image.layer.borderColor = UIColor.lightGray.cgColor
            image.layer.cornerRadius = image.frame.height/2
            image.clipsToBounds = true
            
            var bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: hospitalname.frame.height - 1, width: hospitalname.frame.width, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            bottomLine.opacity = 0.87
            hospitalname.borderStyle = .none
            hospitalname.layer.addSublayer(bottomLine)
            
            var bottomLine1 = CALayer()
            bottomLine1.frame = CGRect(x: 0.0, y: reason.frame.height - 1, width: reason.frame.width, height: 1.0)
            bottomLine1.backgroundColor = UIColor.lightGray.cgColor
            reason.borderStyle = .none
            reason.layer.addSublayer(bottomLine1)
            
            
            //set data
            reason.text = Appointment.meeting_type
            patName.text = Appointment.Doctor_name
            date.text = Appointment.Date
            time.text = Appointment.time
     
    }
    
    
    
}
