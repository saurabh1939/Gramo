//
//  ForgotPasswordViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 24/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire




class ForgotPasswordViewController: UIViewController {
    
    
 //   static var KEYBOARD_ANIMATION_DURATION=0.3;
  //  static var MINIMUM_SCROLL_FRACTION=0.2;
  //  static var MAXIMUM_SCROLL_FRACTION=0.8;
  //  static var PORTRAIT_KEYBOARD_HEIGHT=216;
  //  static var LANDSCAPE_KEYBOARD_HEIGHT=162;
   // var animatedDistance;


    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var textEmail:UITextField!
    
    @IBOutlet var viewFirst:UIView!
    @IBOutlet var viewSecond:UIView!

    
    @IBOutlet var scrollMain:UIScrollView!
    
    @IBOutlet var buttonEmail:UIButton!
    @IBOutlet var buttonBack:UIButton!
    @IBOutlet var buttonSend:UIButton!
    @IBOutlet var buttonContinue:UIButton!

    
    @IBOutlet var imageLineEmail:UIImageView!
    @IBOutlet var toolBarKeyBoard: UIToolbar!

    

    
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
        buttonSend.layer.cornerRadius=buttonSend.frame.size.height/2;
        buttonContinue.layer.cornerRadius=buttonContinue.frame.size.height/2;

     //   scrollMain.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scrollMain.contentSize=CGSize(width: UIScreen.main.bounds.width*2, height: 0)
        textEmail.attributedPlaceholder = NSAttributedString(string: textEmail.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        textEmail.inputAccessoryView = toolBarKeyBoard



        
    }
    
    func invalidEmail()
    {
        imageLineEmail.backgroundColor=UIColor.red
        textEmail.textColor=UIColor.red
        buttonEmail.isHidden=false
    }
    
    func cancelEmail()
    {
        imageLineEmail.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textEmail.textColor=UIColor.white
        buttonEmail.isHidden=true
    }
    
    
    @IBAction func buttonEmailCrossClicked()
    {
        cancelEmail()
        textEmail.text=""
        
    }
    
    @IBAction func toolBarDoneClicked()
    {
        self.view.endEditing(true)
    }


    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSendClicked()
    {
//        let signUpVC2:Signup2ViewController = Signup2ViewController(nibName:"Signup2ViewController", bundle:nil)
//        self.navigationController?.pushViewController(signUpVC2, animated: true)
      //  scrollMain.contentOffset=CGPoint(x: UIScreen.main.bounds.width, y: -20)
        
        if textEmail.text==""
        {
            invalidEmail()
        }
        else if !appDelegate.isValidEmailAddress(emailAddressString: textEmail.text!)
        {
            invalidEmail()
        }
        else
        {
            ApiForgotPassword()
        }

        
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
    
    
    @IBAction func buttonContinueClicked()
    {
        //        let signUpVC2:Signup2ViewController = Signup2ViewController(nibName:"Signup2ViewController", bundle:nil)
        //        self.navigationController?.pushViewController(signUpVC2, animated: true)
        self.navigationController?.popViewController(animated: true)

        
    }
    
    
    
    // MARK: -UITEXTFIELD DELEGATES
    func textFieldDidBeginEditing(_ textField: UITextField)
    {    //delegate method
        cancelEmail()
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
        //        if (range.length == 1 && string.isEmpty){
        //            print("Used Backspace")
        //            return true
        //
        //        }
        //        if(textField.text?.characters.count == 10)
        //        {
        //            textField.resignFirstResponder()
        //            return false
        //        }
        return true
    }
    
    func ApiForgotPassword()
    {
        self.appDelegate.showHud(title: "Sending Mail...", sender: self.view)

        let urlString = "/api/forgotPassword"

     //   email:ayush@wemo.in
        
        let requestParam:Parameters = [
            "email":textEmail.text!,
            "deviceType":kConstant.Constants.via,
            "appVersion":"2",
            "deviceToken":UserDefaults.standard.value(forKey: "deviceToken") as Any,
            
        ]
        let headers: HTTPHeaders = HttpApiModel().header()
        print("\(requestParam)")
        Alamofire.request(kConstant.Constants.kBaseURL.appending(urlString), method: .post, parameters: requestParam, encoding:URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if response.response?.statusCode==200
                {
                    let dict = response.result.value as! NSDictionary
                    
                  //  let result = dict.object(forKey: "response") as! NSDictionary
                    
                    var theJSONText:String! = ""
                    
                    do {
                        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        // here "jsonData" is the dictionary encoded in JSON data
                        
                        theJSONText = NSString(data: jsonData!,
                                               encoding: String.Encoding.ascii.rawValue) as String!
                    }
                    
                    print(theJSONText)
                    

                    
                    self.appDelegate.hideHud()

                    self.scrollMain.contentOffset=CGPoint(x: UIScreen.main.bounds.width, y: -20)

                    
                    
                }
                else
                {
                    self.appDelegate.hideHud()

                    self.appDelegate.showAlert(Title: response.result.value as? String ?? "errorMsg")
                }
                break
            case .failure(_):
                self.appDelegate.hideHud()

                print(response.result.error ?? "Response")
                
                break
                
            }
            
        }
    }

}
