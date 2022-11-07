//
//  CoomonSignUp.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class CoomonSignUp:UIViewController{
    
    @IBAction func signUpPat(_ sender: Any) {
         self.performSegue(withIdentifier: "pat", sender: self)
    }
 
    @IBAction func signUpDoc(_ sender: Any) {
         self.performSegue(withIdentifier: "doc", sender: self)
    }
}
