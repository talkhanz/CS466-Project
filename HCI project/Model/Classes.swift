//
//  Classes.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/23/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation

class Appointments{
    
    var meeting_type:String?
    var user_id:String?
    var Doctor_name:String?
    var time:String?
    var Date:String?
    var Day:String?

    init(meeting_type: String,user_id:String,Doctor_name:String,time:String?,Date:String,Day:String){
        self.meeting_type = meeting_type
        self.user_id = user_id
        self.Doctor_name = Doctor_name
        self.time = time
        self.Date = Date
        self.Day = Day
    
    }
    
}


  

