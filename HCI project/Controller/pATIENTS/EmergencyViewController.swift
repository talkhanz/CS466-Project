//
//  EmergencyViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class EmergencyViewController:UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var doctors = ["Dr Kamran","Dr Ahmed","Dr Raza"]
    var numbers = ["0324673937","03326710237","0331637378"]
    var filteredData: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filteredData = doctors
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.setNavigationBarHidden(false, animated: true)
                      navigationController?.navigationBar.barTintColor =  UIColor(red: 40/255, green: 154/255, blue: 149/255, alpha: 1.0)
              navigationController?.navigationBar.tintColor =  UIColor.white
              self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}

extension EmergencyViewController:UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          filteredData.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyCell", for: indexPath) as! EmergencyCell

        cell.docName.text = filteredData[indexPath.row]
          
          cell.outerView.layer.borderWidth = 2
          cell.outerView.layer.borderColor = UIColor.lightGray.cgColor
          
          //image
          //cell.profileImage.layer.borderWidth = 1
          cell.docImage.layer.masksToBounds = false
          cell.docImage.layer.borderColor = UIColor.lightGray.cgColor
          cell.docImage.layer.cornerRadius = cell.docImage.frame.height/2
          cell.docImage.clipsToBounds = true
          cell.selectionStyle = .none
          return cell
      }

      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 let phoneNumber = "1234567890"
        
        if let url = URL(string: "tel://\(phoneNumber)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
        

    }
      
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

          filteredData = searchText.isEmpty ? doctors : doctors.filter({(dataString: String) -> Bool in
              // If dataItem matches the searchText, return true to include it
              return dataString.range(of: searchText, options: .caseInsensitive) != nil
          })

          tableView.reloadData()
      }



}
