//
//  patDetailViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/25/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit



class patDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var segmentedControll: UISegmentedControl!
    @IBOutlet var formView: UIView!
    @IBOutlet var formTableView: UITableView!
    let  moviePlayer =  AVPlayerViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        formTableView.estimatedRowHeight = 110
        formTableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func segmentedValueChange(_ sender: UISegmentedControl) {
        
        if segmentedControll.selectedSegmentIndex == 0 {
            //form
            formView.isHidden = false
            
        } else if segmentedControll.selectedSegmentIndex == 1 {
            
            //videos
        } else {
            ///chat
        }
        formTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmentedControll.selectedSegmentIndex == 0  {
            
            return 4
        } else if segmentedControll.selectedSegmentIndex == 1 {
            
            return 1
        }
        return 1
    }
    
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  if segmentedControll.selectedSegmentIndex == 1
             {
                 if indexPath.row ==  0{
     if let filePath = Bundle.main.path(forResource: "video1", ofType: "m4v"){
                              let videoURL = NSURL(fileURLWithPath: filePath)
                              let player = AVPlayer(url: videoURL as URL)
                              moviePlayer.player = player
                              self.present(moviePlayer, animated: true) {
                                  self.moviePlayer.player!.play()
                              }
                          }

                          else{
                                  let alertController = UIAlertController(title: "Server Error!", message: "Cannot play media.", preferredStyle: .alert)

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
                 }
    
     }
           

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if segmentedControll.selectedSegmentIndex == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PostSomethingTableViewCell", for: indexPath) as! PostSomethingTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailTableViewCell", for: indexPath) as! PostDetailTableViewCell
                
                if indexPath.row == 1{
                    
                    cell.likes.text = "46747 Members"
                    cell.title.text = "National Care Care"
                    cell.detailLabel.text = "Beating Cancer"
                    cell.detailImage.image = UIImage(named:"cancer1")
                    cell.profileIcon.image = UIImage(named:"community1")
                }else if indexPath.row == 2{
                    cell.likes.text = "1343 Members"
                    cell.title.text = "Shaukat Khanam"
                    cell.detailLabel.text = "One year to a complete cure for cancer"
                     cell.detailImage.image = UIImage(named:"cancer2")
                    cell.profileIcon.image = UIImage(named:"Community2")
                    
                }else{
                    cell.likes.text = "542 Members"
                    cell.title.text = "Patient Power"
                    cell.detailLabel.text = "So difficult to find a cure"
                     cell.detailImage.image = UIImage(named:"community3")
                    cell.profileIcon.image = UIImage(named:"community3")
                }
                
                
                
                
                return cell
            }
        } else if segmentedControll.selectedSegmentIndex == 1 {
                      let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
            
            if indexPath.row == 1{
                cell.likes.text = "46747 Members"
                cell.title.text = "National Care Care"
               // cell.videoimage.image = UIImage(named:"video1image")
            }
            
            return cell
        }
        return UITableViewCell()
    }

}

