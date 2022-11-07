//
//  docSignUp.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import  UIKit

class docSignUp:UIViewController{
    
    
    @IBOutlet var password: UITextField!
    @IBOutlet var number: UITextField!
    @IBOutlet var username: UITextField!
    
    
    override func viewDidLoad() {
        var bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: password.frame.height - 1, width: password.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.white.cgColor
        password.borderStyle = .none
        password.layer.addSublayer(bottomLine1)
        
        var bottomLine = CALayer()
         bottomLine.frame = CGRect(x: 0.0, y: number.frame.height - 1, width: number.frame.width, height: 1.0)
         bottomLine.backgroundColor = UIColor.white.cgColor
        number.borderStyle = .none
         number.layer.addSublayer(bottomLine)
        
        var bottomLine3 = CALayer()
         bottomLine3.frame = CGRect(x: 0.0, y: username.frame.height - 1, width: username.frame.width, height: 1.0)
         bottomLine3.backgroundColor = UIColor.white.cgColor
        username.borderStyle = .none
        username.layer.addSublayer(bottomLine3)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        
    }
    @objc func dismissKeyboard() {
         //Causes the view (or one of its embedded text fields) to resign the first responder status.
         view.endEditing(true)
     }
    
    @IBAction func signup(_ sender: Any) {
        
        
         let alertController = UIAlertController(title: "Server Error!", message: "Please try again later.", preferredStyle: .alert)

            // Create the actions
         let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK Pressed")
                for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: LoginViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
            }
            alertController.addAction(okAction)

         self.present(alertController, animated: true, completion: nil)
        

}
}
