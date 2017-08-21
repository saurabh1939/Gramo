//
//  MusicTripSummaryViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 10/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit


    class MusicTripSummaryViewController: UIViewController {
        
        @IBOutlet var collectionRecommend:UICollectionView!
        
        @IBOutlet var viewTop:UIView!
        @IBOutlet var viewBottom:UIView!
        @IBOutlet var viewPopUp:UIView!
        @IBOutlet var viewPrice:UIView!
        @IBOutlet var viewPlusMinus:UIView!
        @IBOutlet var viewBookingConfirmed:UIView!
        
        
        @IBOutlet var buttonPlus:UIButton!
        @IBOutlet var buttonMinus:UIButton!
        @IBOutlet var buttonEdit:UIButton!
        @IBOutlet var labelQuantity:UILabel!
        @IBOutlet var labelEventName:UILabel!
        @IBOutlet var labelEventDate:UILabel!
        @IBOutlet var labelEventTime:UILabel!
        
        
        
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.setUp()
           
            
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        func setUp()
        {
            
            viewPlusMinus.layer.borderWidth=1
            //        buttonMinus.layer.borderWidth=1
            buttonEdit.layer.borderWidth=1
            labelQuantity.layer.borderWidth=1
            
            viewPlusMinus.layer.borderColor=UIColor.lightGray.cgColor
            //        buttonMinus.layer.borderColor=UIColor.lightGray.cgColor
            buttonEdit.layer.borderColor=UIColor.lightGray.cgColor
            labelQuantity.layer.borderColor=UIColor.lightGray.cgColor
            
            
            viewPlusMinus.layer.cornerRadius=3
            buttonEdit.layer.cornerRadius=3
            viewBookingConfirmed.layer.cornerRadius=5
            
            
            
            
        }
        
        
        
        @IBAction func buttonBackClicked()
        {
            self.navigationController?.popViewController(animated: true)
        }
        
        @IBAction func buttonPlusClicked()
        {
            //self.navigationController?.popViewController(animated: true)
        }
        
        @IBAction func buttonMinusClicked()
        {
            //self.navigationController?.popViewController(animated: true)
        }
        
        @IBAction func buttonEditClicked()
        {
            // self.navigationController?.popViewController(animated: true)
        }
        
        
        @IBAction func buttonBackgroundClicked()
        {
            viewPopUp.isHidden=true
            viewPrice.isHidden=true
            viewBookingConfirmed.isHidden=true
            
        }
        
        @IBAction func buttonBottomClicked()
        {
            viewPopUp.isHidden=false
            viewPrice.isHidden=false
        }
        
        @IBAction func buttonSlideClicked()
        {
            viewPopUp.isHidden=false
            viewBookingConfirmed.isHidden=false
            
        }
        
        
        
        
        

}
