//
//  LoginViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/23/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController:UIViewController,UITextFieldDelegate{

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad(){
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: userName.frame.height - 1, width: userName.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        bottomLine.opacity = 0.87
        userName.borderStyle = .none
        userName.layer.addSublayer(bottomLine)
        
        var bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: password.frame.height - 1, width: password.frame.width, height: 1.0)
        bottomLine1.backgroundColor = UIColor.white.cgColor
        password.borderStyle = .none
        password.layer.addSublayer(bottomLine1)
        
        password.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    
        super.viewDidLoad()

        
    }
    
    @IBAction func SignUp(_ sender: Any) {
         self.performSegue(withIdentifier: "commonSignUp", sender: self)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
  
       navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func authenticate(){
        
        if (userName.text == "" && password.text == "")
        {
            self.performSegue(withIdentifier: "showDashboard", sender: self)
        }else if (userName.text == "p" && password.text == ""){
             self.performSegue(withIdentifier: "showPatientDashboard", sender: self)
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
  
    @IBAction func login(_ sender: Any) {
        self.authenticate()
    }
    

}
