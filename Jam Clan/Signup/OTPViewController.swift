//
//  OTPViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 27/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textOTP:UITextField!
    
    @IBOutlet var buttonSubmit:UIButton!
    @IBOutlet var buttonResend:UIButton!
    
    @IBOutlet var toolBarKeyBoard: UIToolbar!



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews(){
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setup()
    {
        textOTP.attributedPlaceholder = NSAttributedString(string: textOTP.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        buttonSubmit.layer.cornerRadius=buttonSubmit.frame.size.height/2;
        
        textOTP.inputAccessoryView = toolBarKeyBoard



    }
    
    @IBAction func buttonSubmitClicked()
    {
        let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
        self.navigationController?.pushViewController(StudiosHomeVC, animated: true)
        
    }
    
    @IBAction func toolBarDoneClicked()
    {
        self.view.endEditing(true)
    }

    
    
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
        animateViewMoving(up: true, moveValue: 100)
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
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
