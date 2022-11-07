//
//  AddAppointment.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit


class AddAppointment:UIViewController,UITextFieldDelegate{
    
    var delegate : AddAppointmentDelegate?
    @IBOutlet var hospitalName: UITextField!
    
    @IBOutlet var reason: UITextField!
    @IBOutlet var doctorName: UITextField!
    @IBOutlet var outerView: UIView!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var patientName: UITextField!
    
    var selectedDate:String!
    var selectedTime:String!
    override func viewDidLoad(){
    selectedDate = "23 Nov 2019"
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: hospitalName.frame.height - 1, width: hospitalName.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
       // bottomLine.opacity = 0.87
        //bottomLine.backgroundColor?.alpha = 0.87
        hospitalName.borderStyle = .none
        hospitalName.layer.addSublayer(bottomLine)
        
        var bottomLine1 = CALayer()
         bottomLine1.frame = CGRect(x: 0.0, y: reason.frame.height - 1, width: reason.frame.width, height: 1.0)
         bottomLine1.backgroundColor = UIColor.lightGray.cgColor
        // bottomLine.opacity = 0.87
         //bottomLine.backgroundColor?.alpha = 0.87
         reason.borderStyle = .none
         reason.layer.addSublayer(bottomLine1)
        
        var bottomLine2 = CALayer()
         bottomLine2.frame = CGRect(x: 0.0, y: doctorName.frame.height - 1, width: doctorName.frame.width, height: 1.0)
         bottomLine2.backgroundColor = UIColor.lightGray.cgColor
        // bottomLine.opacity = 0.87
         //bottomLine.backgroundColor?.alpha = 0.87
         doctorName.borderStyle = .none
         doctorName.layer.addSublayer(bottomLine2)
        
        var bottomLine3 = CALayer()
         bottomLine3.frame = CGRect(x: 0.0, y: patientName.frame.height - 1, width: patientName.frame.width, height: 1.0)
         bottomLine3.backgroundColor = UIColor.lightGray.cgColor
        // bottomLine.opacity = 0.87
         //bottomLine.backgroundColor?.alpha = 0.87
         patientName.borderStyle = .none
         patientName.layer.addSublayer(bottomLine3)
        
        outerView.layer.borderWidth = 1
        outerView.layer.borderColor = UIColor.lightGray.cgColor
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        
     //   let dateFormatter = DateFormatter()
//
//        dateFormatter.dateStyle = DateFormatter.Style.short
//        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        
       // datePicker.datePickerMode = UIDatePicker.Mode.time
        let date = datePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        print(components)

//        let strDate = dateFormatter.string(from: datePicker.date)
//        print(strDate)
    }
    @IBAction func save(_ sender: Any) {
       
        let alert = UIAlertController(title: "Success!", message: "Appointment added successfully", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)


        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
             alert.dismiss(animated: true, completion: nil)
            let appointment = Appointments(meeting_type: self.reason.text!, user_id: "1", Doctor_name: self.patientName.text!, time: "12:35 AM", Date:self.selectedDate!, Day: "Mon")
            
             self.delegate?.currencyViewControllerDidSelect(value: appointment)
             self.navigationController!.popViewController(animated: true)
         
        }
        
//                let appointment = Appointments(meeting_type: "test", user_id: "1", Doctor_name: "test", time: "wtf", Date:selectedDate!, Day: "Mon")
//
//        self.delegate?.currencyViewControllerDidSelect(value: appointment)
//        self.navigationController!.popViewController(animated: true)
    }


    

}

protocol AddAppointmentDelegate {
  func currencyViewControllerDidSelect(value: Appointments)
}
