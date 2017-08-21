//
//  Signup1ViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 24/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire


class Signup1ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var textUserName:UITextField!
    @IBOutlet var textEmail:UITextField!
    @IBOutlet var textPassword:UITextField!
    @IBOutlet var textPhoneNo:UITextField!
    @IBOutlet var textLocation:UITextField!
    
    @IBOutlet var buttonUserName:UIButton!
    @IBOutlet var buttonEmail:UIButton!
    @IBOutlet var buttonPassword:UIButton!
    @IBOutlet var buttonPhoneNo:UIButton!
    @IBOutlet var buttonLocation:UIButton!
    @IBOutlet var buttonBack:UIButton!
    @IBOutlet var buttonNext:UIButton!
    
    @IBOutlet var imageLineUserName:UIImageView!
    @IBOutlet var imageLineEmail:UIImageView!
    @IBOutlet var imageLinePassword:UIImageView!
    @IBOutlet var imageLinePhoneNo:UIImageView!
    @IBOutlet var imageLineLocation:UIImageView!

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
        buttonNext.layer.cornerRadius=buttonNext.frame.size.height/2;
        
        textEmail.attributedPlaceholder = NSAttributedString(string: textEmail.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        textPassword.attributedPlaceholder = NSAttributedString(string: textPassword.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])

        textPhoneNo.attributedPlaceholder = NSAttributedString(string: textPhoneNo.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        textLocation.attributedPlaceholder = NSAttributedString(string: textLocation.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])

        textUserName.attributedPlaceholder = NSAttributedString(string: textUserName.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        textLocation.text=UserDefaults.standard.value(forKey: "currentCity") as? String
        
        textUserName.inputAccessoryView = toolBarKeyBoard
        textPassword.inputAccessoryView = toolBarKeyBoard
        textEmail.inputAccessoryView = toolBarKeyBoard
        textPhoneNo.inputAccessoryView = toolBarKeyBoard
        textLocation.inputAccessoryView = toolBarKeyBoard

        
    }
    
    func invalidName()
    {
        imageLineUserName.backgroundColor=UIColor.red
        textUserName.textColor=UIColor.red
        buttonUserName.isHidden=false
    }
    
    func invalidEmail()
    {
        imageLineEmail.backgroundColor=UIColor.red
        textEmail.textColor=UIColor.red
        buttonEmail.isHidden=false
    }
    
    func invalidPassword()
    {
        imageLinePassword.backgroundColor=UIColor.red
        textPassword.textColor=UIColor.red
        buttonPassword.isSelected=true
        buttonPassword.setImage(UIImage(named: "emailidclose.png"), for: .normal)
    }
    
    func invalidPhoneNo()
    {
        imageLinePhoneNo.backgroundColor=UIColor.red
        textPhoneNo.textColor=UIColor.red
        buttonPhoneNo.isHidden=false
    }
    
    func invalidLocation()
    {
        imageLineLocation.backgroundColor=UIColor.red
        textLocation.textColor=UIColor.red
        buttonLocation.isHidden=false
    }
    
    func cancelName()
    {
        imageLineUserName.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textUserName.textColor=UIColor.white
        buttonUserName.isHidden=true
    }
    
    func cancelEmail()
    {
        imageLineEmail.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textEmail.textColor=UIColor.white
        buttonEmail.isHidden=true
    }
    
    func cancelPassword()
    {
        imageLinePassword.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textPassword.textColor=UIColor.white
        buttonPassword.isSelected=false
        buttonPassword.setImage(UIImage(named: "writepassword.png"), for: .normal)
        
        
    }
    
    func cancelPhone()
    {
        imageLinePhoneNo.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textPhoneNo.textColor=UIColor.white
        buttonPhoneNo.isHidden=true
    }
    
    func cancelLocation()
    {
        imageLineLocation.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textLocation.textColor=UIColor.white
        buttonLocation.isHidden=true
    }

    
    @IBAction func buttonPasswordClicked()
    {
        
        if buttonPassword.isSelected
        {
            
            buttonPassword.isSelected=false
            buttonPassword.setImage(UIImage(named: "writepassword.png"), for: .normal)
            textPassword.text=""
            
            
        }
        else
        {
            if textPassword.isSecureTextEntry
            {
                textPassword.isSecureTextEntry=false
            }
            else
            {
                textPassword.isSecureTextEntry=true
            }
        }
    }
    
    @IBAction func buttonNameCrossClicked()
    {
        cancelName()
        textUserName.text=""
        
    }
    
    @IBAction func buttonEmailCrossClicked()
    {
        cancelEmail()
        textEmail.text=""
        
    }
    
    @IBAction func buttonPhoneCrossClicked()
    {
        cancelPhone()
        textPhoneNo.text=""
        
    }
    
    @IBAction func buttonLocationCrossClicked()
    {
        cancelLocation()
        textLocation.text=""
        
    }



    @IBAction func buttonBackClicked()
    {
    self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toolBarDoneClicked()
    {
        self.view.endEditing(true)
    }

    
    @IBAction func buttonNextClicked()
    {
//        let signUpVC2:Signup2ViewController = Signup2ViewController(nibName:"Signup2ViewController", bundle:nil)
//        self.navigationController?.pushViewController(signUpVC2, animated: true)
        
        if textUserName.text==""
        {
            invalidName()
        }
       else if textEmail.text==""
        {
            invalidEmail()
        }
        else if !appDelegate.isValidEmailAddress(emailAddressString: textEmail.text!)
        {
            invalidEmail()
        }
        else if textPassword.text==""
        {
            invalidPassword()
        }
        else if textPhoneNo.text==""
        {
            invalidPhoneNo()
        }
        else if textLocation.text==""
        {
            invalidLocation()
        }
        else
        {
            ApiSignup()
        }

        
        
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
        cancelEmail()
        cancelPassword()
        cancelName()
        cancelLocation()
        cancelPhone()
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

    
    func ApiSignup()
    {
        self.appDelegate.showHud(title: "Signing In...", sender: self.view)

        let urlString = "/api/register"
        
     //   name=AyushBansal,email=ayush%40wemo.in,password=123456,phone=8860368057,location=Delhi,deviceType=iOS,lat=22.45,long=78.33,appVersion=1,deviceToken=sdsfeerfeggfergegergr,deviceModel=Samsung,deviceVersion=23
        
        let requestParam:Parameters = [
            "name":textUserName.text!,
            "email":textEmail.text!,
            "password":textPassword.text!,
            "phone":textPhoneNo.text!,
            "location":textLocation.text!,
            "deviceType":kConstant.Constants.via,
            "lat":UserDefaults.standard.value(forKey: "lat") as Any,
            "long":UserDefaults.standard.value(forKey: "long") as Any,
            "appVersion":"2",
            "deviceToken":UserDefaults.standard.value(forKey: "deviceToken")as Any,
            "deviceModel":"",
            "deviceVersion":""
            
        ]
        let headers: HTTPHeaders = HttpApiModel().header()
        print("\(requestParam)")
        Alamofire.request(kConstant.Constants.kBaseURL.appending(urlString), method: .post, parameters: requestParam, encoding:URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
           // print("\(response)")
            switch(response.result) {
            case .success(_):
                if response.response?.statusCode==200
                {
                    
                    let dict = response.result.value as! NSDictionary
                    var theJSONText:String! = ""

                    do {
                        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        // here "jsonData" is the dictionary encoded in JSON data
                        
                        theJSONText = NSString(data: jsonData!,
                                               encoding: String.Encoding.ascii.rawValue) as String!
                    }
                    
                    print(theJSONText)

                    
                    let result = dict.object(forKey: "response") as! NSDictionary
                    
                    UserDefaults.standard.set(result.value(forKey: "userToken"), forKey: "authToken")
                    UserDefaults.standard.synchronize()
                    
                    UserDefaults.standard.set(result.value(forKey: "_id"), forKey: "userid")
                    UserDefaults.standard.synchronize()
                    
                    UserDefaults.standard.set(result, forKey: "userDetails")
                    UserDefaults.standard.synchronize()
                    
                    
                    let signUpVC2:Signup2ViewController = Signup2ViewController(nibName:"Signup2ViewController", bundle:nil)
                    self.navigationController?.pushViewController(signUpVC2, animated: true)

                    
                    
                    self.appDelegate.hideHud()

                    
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
