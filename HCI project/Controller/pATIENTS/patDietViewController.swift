//
//  patDietViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class patDietViewController:UIViewController,AddDietDelegate{
    
 
    @IBOutlet var tableView: UITableView!
//    @IBAction func addAppointmentTapped(_ sender: Any) {
//
//        performSegue(withIdentifier: "addAppointment", sender: self.appointmentsList)
//    }
    var appointmentsList = [Appointments]()

    override func viewDidLoad() {

        self.parseJsonData()
        tableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.setNavigationBarHidden(false, animated: true)
                      navigationController?.navigationBar.barTintColor =  UIColor(red: 40/255, green: 154/255, blue: 149/255, alpha: 1.0)
              navigationController?.navigationBar.tintColor =  UIColor.white
              self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
 
    
    func currencyControllerDidSelect(value: Appointments)  {
      //do your stuff here
        self.appointmentsList.append(value)
        tableView?.reloadData()
    }
    

    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if segue.identifier == "showPatDietDetail" {
        let vc = segue.destination as! patDietDetail
            vc.Appointment = sender as? Appointments
        }
         
    }
    
    
    func parseJsonData(){
         
      // Folders.removeAll()
         if let path = Bundle.main.path(forResource: "diet", ofType: "json"){
             
             do{
                 let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                  if let jsondata = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]]{
                      
                      for obj in jsondata{
                       // if let sets = obj["sets"] as? [[String : Any]]{
                              
                        let appointments = Appointments(meeting_type: obj["meeting_type"] as! String, user_id: obj["user_id"] as! String, Doctor_name: obj["Doctor_name"] as! String, time: obj["time"] as? String, Date: obj["Date"] as! String, Day: obj["Day"] as! String)
                            //folder.instructions = (obj["is_video"] as? String)
                        appointmentsList.append(appointments)
                        
                             print(appointmentsList)
                      }
                     //self.tableView.reloadData()
                  }
             }
           catch{
                 print("Error in data")
               }
         }
         
     }
 
    
}


extension patDietViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appointmentsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentsCell", for: indexPath) as! AppointmentsCell
        cell.patientName.text = appointmentsList[indexPath.row].user_id
        cell.date.text = appointmentsList[indexPath.row].meeting_type
        cell.time.text = appointmentsList[indexPath.row].time
        cell.view.layer.borderWidth = 2
        cell.view.layer.borderColor = UIColor.lightGray.cgColor
        
        //image
       // cell.profileImage.layer.borderWidth = 1
        cell.profileImage.layer.masksToBounds = false
        cell.profileImage.layer.borderColor = UIColor.lightGray.cgColor
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
        cell.profileImage.clipsToBounds = true
        
        if indexPath.row == 0{
            cell.profileImage.image = UIImage(named:"food1")
        }else if indexPath.row == 1{
            cell.profileImage.image = UIImage(named:"food2")
        }else if indexPath.row == 2{
            cell.profileImage.image = UIImage(named:"food3")
        }else{
            cell.profileImage.image = UIImage(named:"food4")
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "showPatDietDetail", sender: self.appointmentsList[indexPath.row])
        
    }




}
