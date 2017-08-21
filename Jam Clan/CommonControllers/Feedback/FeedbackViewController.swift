//
//  FeedbackViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 10/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

    class FeedbackViewController: UIViewController,FloatRatingViewDelegate,UITextViewDelegate {

        @IBOutlet  var textViewFeedback:UITextView!
        @IBOutlet  var buttonSend:UIButton!


    @IBOutlet var floatRatingView: FloatRatingView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//self.setup()
        // Do any additional setup after loading the view.
    }
        
        override func viewWillLayoutSubviews(){
            self.setup()
        }

    
    func setup()
    {
        // Required float rating view params
        self.floatRatingView.emptyImage = UIImage(named: "feed-gray-star")
        self.floatRatingView.fullImage = UIImage(named: "feed-star")
        // Optional params
        self.floatRatingView.delegate = self
        self.floatRatingView.contentMode = UIViewContentMode.scaleAspectFit
        self.floatRatingView.maxRating = 5
        self.floatRatingView.minRating = 1
        self.floatRatingView.rating = 3
        self.floatRatingView.editable = true
        self.floatRatingView.halfRatings = true
        self.floatRatingView.floatRatings = false
        buttonSend.layer.cornerRadius=buttonSend.frame.size.height/2;

        
        
    }

        // MARK: FloatRatingViewDelegate
        
        func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating:Float) {
            // self.liveLabel.text = NSString(format: "%.2f", self.floatRatingView.rating) as String
        }
        
        func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Float) {
            //  self.updatedLabel.text = NSString(format: "%.2f", self.floatRatingView.rating) as String
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
            animateViewMoving(up: true, moveValue: 100)
            if textView.text=="write a review"
            {
            textView.text=""
            }
            
            
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            animateViewMoving(up: false, moveValue: 100)
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
