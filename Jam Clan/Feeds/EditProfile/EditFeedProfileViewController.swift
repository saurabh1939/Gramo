//
//  EditFeedProfileViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/06/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class EditFeedProfileViewController: UIViewController {
    
    @IBOutlet var textName:UITextField!
    @IBOutlet var textEmail:UITextField!
    @IBOutlet var textSkills:UITextField!
    @IBOutlet var textPhoneNo:UITextField!
    @IBOutlet var textLocation:UITextField!
    
    @IBOutlet var buttonSave:UIButton!
    @IBOutlet var buttonChangePassword:UIButton!
//    @IBOutlet var buttonPassword:UIButton!
//    @IBOutlet var buttonPhoneNo:UIButton!
//    @IBOutlet var buttonLocation:UIButton!
//    @IBOutlet var buttonBack:UIButton!
//    @IBOutlet var buttonNext:UIButton!
    
    @IBOutlet var imageLineUserName:UIImageView!
    @IBOutlet var imageLineEmail:UIImageView!
    @IBOutlet var imageLineSkills:UIImageView!
    @IBOutlet var imageLinePhoneNo:UIImageView!
    @IBOutlet var imageLineLocation:UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillLayoutSubviews(){
        self.setup()
    }
    
    func setup()
    {
        
        textEmail.attributedPlaceholder = NSAttributedString(string: textEmail.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
        textSkills.attributedPlaceholder = NSAttributedString(string: textSkills.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
        
        textPhoneNo.attributedPlaceholder = NSAttributedString(string: textPhoneNo.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
        textLocation.attributedPlaceholder = NSAttributedString(string: textLocation.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
        
        textName.attributedPlaceholder = NSAttributedString(string: textName.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
        
        
    }
    
    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSaveClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonChangePasswordClicked()
    {
        let changePassVC:ChangePasswordViewController = ChangePasswordViewController(nibName:"ChangePasswordViewController", bundle:nil)
        self.navigationController?.pushViewController(changePassVC, animated: true)
        
    }
    
    
    
    // MARK: -UITEXTFIELD DELEGATES
    func animateViewMoving (up:Bool, moveValue :CGFloat)
    {
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    // MARK: -UITEXTFIELD DELEGATES
    func textFieldDidBeginEditing(_ textField: UITextField)
    {    //delegate method
        animateViewMoving(up: true, moveValue: 90)
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 90)
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {  //delegate method
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return true
    }


}
