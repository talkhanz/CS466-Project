//
//  SearchPatient.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class SearchPatient:UIViewController{
    
    var patients = ["Ayesha Kamran","Ali Ahmed","Gul Khan"]
    var numbers = ["0324673937","03326710237","0331637378"]
    var patName:String!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var filteredData: [String]!
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.identifier == "showDiet" {
//        let vc = segue.destination as! showDiet
//            vc.patientName!.text = patName
//            print(vc.patientName as Any)
//        }
//
//   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // tableView.tableFooterView = UIView()
        searchBar.delegate = self as UISearchBarDelegate
        filteredData = patients
    }
    
    
}

extension SearchPatient:UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentsCell", for: indexPath) as! AppointmentsCell
        cell.patientName.text = filteredData[indexPath.row]
        
        cell.view.layer.borderWidth = 2
        cell.view.layer.borderColor = UIColor.lightGray.cgColor
        
        //image
        //cell.profileImage.layer.borderWidth = 1
        cell.profileImage.layer.masksToBounds = false
        cell.profileImage.layer.borderColor = UIColor.lightGray.cgColor
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
        cell.profileImage.clipsToBounds = true
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        patName = filteredData[indexPath.row]
      performSegue(withIdentifier: "showDiet", sender:self)

  }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
   
        filteredData = searchText.isEmpty ? patients : patients.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })

        tableView.reloadData()
    }
    
    
}


