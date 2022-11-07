//
//  patCommunityViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class patCommunityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var segmentControll: UISegmentedControl!
    @IBOutlet var textField: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
      override func viewWillAppear(_ animated: Bool) {
                  navigationController?.setNavigationBarHidden(false, animated: true)
                        navigationController?.navigationBar.barTintColor =  UIColor(red: 40/255, green: 154/255, blue: 149/255, alpha: 1.0)
                navigationController?.navigationBar.tintColor =  UIColor.white
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
      }

    @IBAction func segmentValueChange(_ sender: Any) {
        
        if segmentControll.selectedSegmentIndex == 0 {
            textField.isHidden = true
        } else {
            textField.isHidden = false
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommunityTableViewCell", for: indexPath) as! CommunityTableViewCell
        let isJoinHide = segmentControll.selectedSegmentIndex == 0 ? true : false
        cell.setupcell(isHideJoin: isJoinHide)
        if indexPath.row == 0{
           // cell.communityImage = ""
            cell.communityImage.image = UIImage(named:"community1")
            cell.headerLabel.text = "National Cancer Care"
            cell.detailLabel.text = "21773 Members"
        }else if indexPath.row == 1{
            cell.headerLabel.text = "Shaukat Khanam "
            cell.detailLabel.text = "3780 Members"
            cell.communityImage.image = UIImage(named:"Community2")
        }else{
            cell.headerLabel.text = "Patient Power"
            cell.detailLabel.text = "1432 Members"
            cell.communityImage.image = UIImage(named:"community3")
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 110
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "patcommunityDetail", sender: nil)
    }
}


