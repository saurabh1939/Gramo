//
//  LoginViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 24/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController,UITextFieldDelegate
{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var buttonLogin:UIButton!
    @IBOutlet var buttonCreateAcc:UIButton!
    @IBOutlet var buttonForgotPass:UIButton!
    @IBOutlet var buttonEmail:UIButton!
    @IBOutlet var buttonPassword:UIButton!

    @IBOutlet var textEmail:FloatLabelTextField!
    @IBOutlet var textPassword:FloatLabelTextField!
    
    @IBOutlet var imageLineEmail:UIImageView!
    @IBOutlet var imageLinePassword:UIImageView!
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
        buttonLogin.layer.cornerRadius=buttonLogin.frame.size.height/2;
        
        textEmail.attributedPlaceholder = NSAttributedString(string: textEmail.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        textPassword.attributedPlaceholder = NSAttributedString(string: textPassword.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        textEmail.inputAccessoryView = toolBarKeyBoard
        textPassword.inputAccessoryView = toolBarKeyBoard


        
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
    
    @IBAction func toolBarDoneClicked()
    {
    self.view.endEditing(true)
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
    
    @IBAction func buttonEmailCrossClicked()
    {
   cancelEmail()
        textEmail.text=""

    }


   @IBAction func buttonLoginClicked()
   {
//    
//    let signUpVC2:Signup2ViewController = Signup2ViewController(nibName:"Signup2ViewController", bundle:nil)
//    self.navigationController?.pushViewController(signUpVC2, animated: true)
//    
    if textEmail.text==""
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
    else
    {
    ApiLogin()
    }

    }
    
    @IBAction func buttonCreateAccClicked()
    {
        let signUpVC : Signup1ViewController = Signup1ViewController(nibName:"Signup1ViewController", bundle:nil)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func buttonForgotPassClicked()
    {
        let forgotVC : ForgotPasswordViewController = ForgotPasswordViewController(nibName:"ForgotPasswordViewController", bundle:nil)
        self.navigationController?.pushViewController(forgotVC, animated: true)

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
    func textFieldDidBeginEditing(_ textField: UITextField)
    {    //delegate method
        cancelEmail()
        cancelPassword()
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
    
    
    func ApiLogin()
    {
        self.appDelegate.showHud(title: "Loging In...", sender: self.view)
        let urlString = "/api/login"
        // email=adnd@jdskc.ocm,password=1234567,deviceType=android,appVersion=2,deviceToken=sdsfeerfeggfergegergrsdsafdsdssdfs,deviceModel=Samsung,deviceVersion=25
        
        let requestParam:Parameters = [
            "email":textEmail.text!,
            "password":textPassword.text!,
            "deviceType":kConstant.Constants.via,
            "appVersion":"2",
            "deviceToken":UserDefaults.standard.value(forKey: "deviceToken") as Any,
            "deviceModel":"",
            "deviceVersion":""
            
        ]
        let headers: HTTPHeaders = HttpApiModel().header()
        print("\(requestParam)")
        Alamofire.request(kConstant.Constants.kBaseURL.appending(urlString), method: .post, parameters: requestParam, encoding:URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
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
                    self.appDelegate.hideHud()
                    
                    
                    print(UserDefaults.standard.value(forKey: "userDetails") ?? "")
                    
                    let isVerified = (UserDefaults.standard.value(forKey: "userDetails") as? NSDictionary)?.value(forKey: "isVerified") as? Int

                    
                    if isVerified == 0
                    {
                        let signUp2VC : Signup2ViewController = Signup2ViewController(nibName:"Signup2ViewController", bundle:nil)
                        self.navigationController?.pushViewController(signUp2VC, animated: true)

                    }
                    else
                    {
                        let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
                        self.navigationController?.pushViewController(StudiosHomeVC, animated: true)
                    }
                    
                   
                    
                    
                    
                }
                else
                {
                    self.appDelegate.showAlert(Title: response.result.value as? String ?? "errorMsg")
                    self.appDelegate.hideHud()

                }
                break
            case .failure(_):
                print(response.result.error ?? "Response")
                self.appDelegate.hideHud()

                
                break
                
            }
            
        }
    }

    
    
}
