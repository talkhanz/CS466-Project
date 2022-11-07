//
//  CommunityViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class CommunityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var segmentControll: UISegmentedControl!
    @IBOutlet var textField: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertController = UIAlertController(title: "Next Release!", message: "Some Community features are still under development.", preferredStyle: .alert)

           // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
               UIAlertAction in
               NSLog("OK Pressed")
           }
           alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
      override func viewWillAppear(_ animated: Bool) {
    
          navigationController?.setNavigationBarHidden(false, animated: true)
          
          navigationController?.navigationBar.barTintColor =  UIColor(red: 54/255, green: 87/255, blue: 152/255, alpha: 1.0)
          navigationController?.navigationBar.tintColor =  UIColor.white
          self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          //tableView.reloadData()
          
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
        
        self.performSegue(withIdentifier: "communityDetail", sender: nil)
    }
}

