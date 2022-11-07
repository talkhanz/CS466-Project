//
//  patientDashboardView.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation

import UIKit

class patientDashboardView:UIViewController{
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.identifier == "showPatientDashboard") {
          let vc = segue.destination as! patientDashboardView
     
     }
 //       else if (segue.identifier == "showPhonics"){
//          let vc = segue.destination as! PhonicsViewController
//          vc.selectedActivityIndex = 0
//          vc.activityList = sender as! [Activity]
//      }else if (segue.identifier == "showGrammar"){
//          let vc = segue.destination as! GrammarViewController
//          vc.selectedActivityIndex = 0
//          vc.activityList = sender as! [Activity]
//      }else if (segue.identifier == "showWordFormation"){
//          let vc = segue.destination as! GrammarViewController
//          vc.selectedActivityIndex = 0
//          vc.activityList = sender as! [Activity]
//      }else if (segue.identifier == "showSentenceFormation"){
//          let vc = segue.destination as! sentenceFormationViewController
//          vc.selectedActivityIndex = 0
//          vc.activityList = sender as! [Activity]
//      }else  if (segue.identifier == "showparagraphFormation"){
//          let vc = segue.destination as! ParagraphFormationViewController
//          vc.selectedActivityIndex = 0
//          vc.activityList = sender as! [Activity]
//      }
  }
    
      override func viewDidLoad() {
      navigationController?.setNavigationBarHidden(false, animated: true)
                 navigationController?.navigationBar.barTintColor =  UIColor(red: 40/255, green: 154/255, blue: 149/255, alpha: 1.0)
         navigationController?.navigationBar.tintColor =  UIColor.white
         self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.setHidesBackButton(true, animated:true);
      }
    
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.setNavigationBarHidden(false, animated: true)
                      navigationController?.navigationBar.barTintColor =  UIColor(red: 40/255, green: 154/255, blue: 149/255, alpha: 1.0)
              navigationController?.navigationBar.tintColor =  UIColor.white
              self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}


extension patientDashboardView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dashboardCell", for: indexPath) as? dashboardCell
        if indexPath.row == 0{
            cell?.label?.text = "Appointments"
            //let image : UIImage = UIImage(named:"community")!
            cell?.image.image =  UIImage(named:"Appointments")!
        }else if indexPath.row == 1{
            cell?.label?.text = "Diet"
            cell?.image.image =  UIImage(named:"diet")!
        }else if indexPath.row == 2 {
            cell?.label?.text = "Medication"
            cell?.image.image =  UIImage(named:"medication")!
        }else if indexPath.row == 3 {
            cell?.label?.text = "Profile"
            cell?.image.image =  UIImage(named:"profile")!
        }else if indexPath.row == 4{
            cell?.label?.text = "Community"
            cell?.image.image =  UIImage(named:"community")!
        }else{
            cell?.label?.text = "Emergency"
            cell?.image.image =  UIImage(named:"emergency")!
        }
    
        

        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: CGFloat((collectionView.frame.size.width / 2)-35), height:  CGFloat((collectionView.frame.size.width / 2)-35))

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if (indexPath.row == 0){
            performSegue(withIdentifier: "showPatientAppointments", sender: self)

        }else if (indexPath.row == 1){
            performSegue(withIdentifier: "showPatDiet", sender:self)

        }else if (indexPath.row == 4)
        {
            performSegue(withIdentifier: "showPatCommunities", sender:self)
        }
        else {
            performSegue(withIdentifier: "showEmergency", sender:self)

        }
        
    }
    
    
}

