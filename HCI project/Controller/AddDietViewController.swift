//
//  AddDietViewController.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/24/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import Foundation
import UIKit

class AddDietViewController:UIViewController{
    
    @IBOutlet var picker: UIDatePicker!
    var selectedIndexPath:IndexPath!
    @IBOutlet var topView: UIView!
    var delegate : AddDietDelegate?
    var selectedDate:String!
    var selectedQuantity:String!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var mealTitle: UITextField!
    
    override func viewDidLoad() {
              topView.layer.borderWidth = 1
          topView.layer.borderColor = UIColor.lightGray.cgColor
        picker.datePickerMode = UIDatePicker.Mode.time
        collectionView.allowsMultipleSelection = false
        selectedDate = "12:45 AM"
        selectedQuantity = "1"
        
        var bottomLine3 = CALayer()
         bottomLine3.frame = CGRect(x: 0.0, y: mealTitle.frame.height - 1, width: mealTitle.frame.width, height: 1.0)
         bottomLine3.backgroundColor = UIColor.lightGray.cgColor
        // bottomLine.opacity = 0.87
         //bottomLine.backgroundColor?.alpha = 0.87
         mealTitle.borderStyle = .none
         mealTitle.layer.addSublayer(bottomLine3)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
        @IBAction func dateChanged(_ sender: Any) {
            
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            selectedDate = dateFormatter.string(from: picker.date)
        }
    
    @IBAction func save(_ sender: Any) {
       
        let alert = UIAlertController(title: "Success!", message: "Diet added successfully", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        
       
        let cell = collectionView.cellForItem(at: selectedIndexPath) as! dietCell
        

        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
             alert.dismiss(animated: true, completion: nil)

            let appointment = Appointments(meeting_type: self.mealTitle.text!, user_id: cell.quantity.text!, Doctor_name: "Sarah", time: self.selectedDate!, Date:self.selectedDate!, Day: "Mon")
            
             self.delegate?.currencyControllerDidSelect(value: appointment)
             self.navigationController!.popViewController(animated: true)
        }
        }
}

extension AddDietViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
       // return selectedSets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dietCell", for: indexPath) as? dietCell
        cell?.quantity.text = "1"
        cell?.dietImage?.layer.masksToBounds = false
         cell?.dietImage?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.dietImage?.layer.cornerRadius = (cell?.dietImage.frame.height)!/2
         cell?.dietImage?.clipsToBounds = true
        
        if indexPath.row == 0{
            cell?.dietImage.image = UIImage(named:"food1")
        }else if indexPath.row == 1{
            cell?.dietImage.image = UIImage(named:"food2")
        }else if indexPath.row == 2{
            cell!.dietImage.image = UIImage(named:"food3")
        }else if indexPath.row == 3{
            cell!.dietImage.image = UIImage(named:"food1")
        }else{
            cell!.dietImage.image = UIImage(named:"food4")
        }
        // cell?.dietImage = .none
        if selectedIndexPath == indexPath{
            cell?.selectImage?.isHidden  = false
            selectedQuantity = cell?.quantity.text
            
        }else{
            cell?.selectImage?.isHidden  = true
        }
        
        
        return cell!
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: CGFloat((collectionView.frame.size.width / 3)-35), height:  CGFloat((collectionView.frame.size.width / 3)-35))

    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath as IndexPath)
//          cell?.layer.borderWidth = 2.0
//          cell?.layer.borderColor = UIColor.gray.cgColor
//        cell?.sele
//    }
         func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
    //        let cell = collectionView.cellForItem(at: indexPath) as? dietCell
    ////        cell?.layer.borderWidth = 200.0
    ////        cell?.layer.borderColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4).cgColor
    //            if cell?.selectImage?.isHidden == true{
    //                cell?.selectImage?.isHidden  = false
    //            }else{
    //                cell?.selectImage?.isHidden  = true
    //            }
            selectedIndexPath = indexPath
            collectionView.reloadData()


    }


    
    
}

protocol AddDietDelegate {
  func currencyControllerDidSelect(value: Appointments)
}
