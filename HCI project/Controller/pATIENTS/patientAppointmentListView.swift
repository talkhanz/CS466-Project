//
//  patientAppointmentListView.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class patientAppointmentListView:UIViewController{
    
    
    @IBOutlet var tableView: UITableView!
    @IBAction func addAppointmentTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "addAppointment", sender: self.appointmentsList)
    }

    var appointmentsList = [Appointments]()
    
    func currencyViewControllerDidSelect(value: Appointments)  {
      //do your stuff here
        self.appointmentsList.append(value)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        //tableView!.tableFooterView = UIView()
        self.parseJsonData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
  
        navigationController?.setNavigationBarHidden(false, animated: true)
                   navigationController?.navigationBar.barTintColor =  UIColor(red: 40/255, green: 154/255, blue: 149/255, alpha: 1.0)
           navigationController?.navigationBar.tintColor =  UIColor.white
           self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //tableView.reloadData()
        
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if segue.identifier == "appointmentDetail" {
        let vc = segue.destination as! AppointmentViewController
            vc.Appointment = sender as? Appointments
        }
         
    }
    
    
    func parseJsonData(){
         
      // Folders.removeAll()
         if let path = Bundle.main.path(forResource: "patientsappointments", ofType: "json"){
             
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
                     
                  }
             }
           catch{
                 print("Error in data")
               }
         }
         
     }
 
    
}


extension patientAppointmentListView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appointmentsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "patientAppointmentCell", for: indexPath) as! patientAppointmentCell
        cell.patientName.text = appointmentsList[indexPath.row].Doctor_name
        cell.date.text = appointmentsList[indexPath.row].Date
        cell.day.text = appointmentsList[indexPath.row].Day
        cell.time.text = appointmentsList[indexPath.row].time
        cell.reason.text = appointmentsList[indexPath.row].meeting_type
        cell.view.layer.borderWidth = 2
        cell.view.layer.borderColor = UIColor.lightGray.cgColor
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "appointmentDetail", sender: self.appointmentsList[indexPath.row])
        
    }




}
