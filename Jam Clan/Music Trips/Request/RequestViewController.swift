//
//  RequestViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 10/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UITextViewDelegate
{
   @IBOutlet  var textViewRequest:UITextView!
    
    @IBOutlet  var buttonSubmit:UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillLayoutSubviews(){
        self.setup()
    }
    
    
    func setup() {
        buttonSubmit.layer.cornerRadius=buttonSubmit.frame.size.height/2;

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
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
    func textViewDidBeginEditing(_ textView: UITextView)
    {    //delegate method
        animateViewMoving(up: true, moveValue: 80)
        if textView.text=="Your thoughts"
        {
            textView.text=""
        }

        
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        animateViewMoving(up: false, moveValue: 80)
    }
    
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool
    {  //delegate method
        return true
    }
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool
    {   //delegate method
        textView.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
