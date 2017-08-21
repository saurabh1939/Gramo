//
//  Signup2ViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 24/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire


class Signup2ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var textAboutMe:UITextField!
    @IBOutlet var textSkills:UITextField!
    @IBOutlet var textInstruments:UITextField!
    
    @IBOutlet var buttonAboutMe:UIButton!
    @IBOutlet var buttonSkillCancelled:UIButton!
    @IBOutlet var buttonInstrumentCancelled:UIButton!
    @IBOutlet var buttonBack:UIButton!
    @IBOutlet var buttonSignUp:UIButton!
    
    @IBOutlet var imageLineAboutMe:UIImageView!
    @IBOutlet var imageLineSkills:UIImageView!
    @IBOutlet var imageLineInstruments:UIImageView!
    @IBOutlet var imageProfile:UIImageView!
    
    @IBOutlet var toolBarKeyBoard: UIToolbar!
    
    @IBOutlet var buttonSkill:UIButton!
    @IBOutlet var buttonInstruments:UIButton!
    
    
    var arrayInstruments : NSMutableArray!
    var arraySkills : NSMutableArray!





    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.getNotificationCenterInstruments), name: NSNotification.Name(rawValue: "getInstruments"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getNotificationCenterSkills), name: NSNotification.Name(rawValue: "getSkills"), object: nil)

        self.arrayInstruments = []
        self.arraySkills = []


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews(){
        self.setup()
    }
    
    func getNotificationCenterInstruments(notification: Notification)
    {
      //  print("CLICKED NOTIFICATION")
        arrayInstruments.removeAllObjects()
        arrayInstruments.addObjects(from: (notification.object as! NSArray) as! [Any])
        print(arrayInstruments)
        textInstruments.text=(arrayInstruments.value(forKey: "englishName") as AnyObject).componentsJoined(by: ", ")
        
    }
    
    func getNotificationCenterSkills(notification: Notification)
    {
        //  print("CLICKED NOTIFICATION")
        arraySkills.removeAllObjects()
        arraySkills.addObjects(from: (notification.object as! NSArray) as! [Any])
        print(arraySkills)
        textSkills.text=(arraySkills.value(forKey: "englishName") as AnyObject).componentsJoined(by: ", ")
        
    }

    
    func setup()
    {
        buttonSignUp.layer.cornerRadius=buttonSignUp.frame.size.height/2;
        
        textSkills.attributedPlaceholder = NSAttributedString(string: textSkills.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        textAboutMe.attributedPlaceholder = NSAttributedString(string: textAboutMe.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        textInstruments.attributedPlaceholder = NSAttributedString(string: textInstruments.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        textSkills.inputAccessoryView = toolBarKeyBoard
        textAboutMe.inputAccessoryView = toolBarKeyBoard
        textInstruments.inputAccessoryView = toolBarKeyBoard
        
        imageProfile.layer.cornerRadius=imageProfile.frame.size.height/2
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.ProfileTapped(_:)))
        imageProfile.isUserInteractionEnabled = true
        imageProfile.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
    func ProfileTapped(_ sender:AnyObject)
    {
        
        openAlertPopup()

    }
    
    func invalidAbout()
    {
        imageLineAboutMe.backgroundColor=UIColor.red
        textAboutMe.textColor=UIColor.red
        buttonAboutMe.isHidden=false
    }
    
    func invalidSkills()
    {
        imageLineSkills.backgroundColor=UIColor.red
        textSkills.textColor=UIColor.red
        buttonSkillCancelled.isHidden=false
    }
    
    func invalidInstruments()
    {
        imageLineInstruments.backgroundColor=UIColor.red
        textInstruments.textColor=UIColor.red
        buttonInstrumentCancelled.isHidden=false
    }
    
    func cancelAbout()
    {
        imageLineAboutMe.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textAboutMe.textColor=UIColor.white
        buttonAboutMe.isHidden=true
    }
    
    func cancelInstruments()
    {
        imageLineInstruments.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textInstruments.textColor=UIColor.white
        buttonInstrumentCancelled.isHidden=true
    }
    
    func cancelSkills()
    {
        imageLineSkills.backgroundColor=UIColor(red: 255/85, green: 255/64, blue: 255/46, alpha: 1)
        textSkills.textColor=UIColor.white
        buttonSkillCancelled.isHidden=true
    }
    
   

    
    
    func openAlertPopup(){
        let alertController = UIAlertController(title: "Add profile photo", message: nil, preferredStyle: .actionSheet)
        let fromCameraButton = UIAlertAction(title: "From Camera", style: .default, handler: { (action) -> Void in
            print("camera button tapped")
            self.openCameraButton(sender: action)
        })
        let  fromPhotoLibButton = UIAlertAction(title: "From Photo Library", style: .default, handler: { (action) -> Void in
            print("gallery button tapped")
            self.openPhotoLibraryButton(sender: action)
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        alertController.addAction(fromCameraButton)
        alertController.addAction(fromPhotoLibButton)
        alertController.addAction(cancelButton)
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }
    
    
    func openCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
       //     let imageView = UIImageView()
         //   imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imageProfile.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            
            let imgData:NSData = UIImageJPEGRepresentation(imageProfile.image!, 0.50)! as NSData
            
//            kConstant.Constants.chooseBackgroundImageArray.removeAllObjects()
//            kConstant.Constants.headerImageArray.removeAllObjects()
//            kConstant.Constants.headerImageArray.add(imgData)
            
            
//            DispatchQueue.main.async {
//                self.headerImageView.image = UIImage(data: kConstant.Constants.headerImageArray.object(at: 0) as! Data)
//                CommonController.shared.showHud(title: "Loading..", sender: self.view)
//                self.updateCoverPicWithAlamofire()
//            }
        }
        picker.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func buttonAboutCrossClicked()
    {
        cancelAbout()
        textAboutMe.text=""
        
    }
    
    @IBAction func buttonInstrumentsCrossClicked()
    {
        cancelInstruments()
        textInstruments.text=""
        
    }
    
    @IBAction func buttonSkillsCrossClicked()
    {
        cancelSkills()
        textSkills.text=""
        
    }

    
    
    @IBAction func buttonInstrumentsClicked()
    {
        toolBarDoneClicked()
        let instrumentVC:InstrumentsViewController = InstrumentsViewController(nibName:"InstrumentsViewController", bundle:nil)
        instrumentVC.arraySelectedItems = []
        instrumentVC.arraySelectedItems.addObjects(from: arrayInstruments as! [Any])
        self.navigationController?.pushViewController(instrumentVC, animated: true)
    }
    
    @IBAction func buttonSkillClicked()
    {
        toolBarDoneClicked()
        let skillsVC:ServicesViewController = ServicesViewController(nibName:"ServicesViewController", bundle:nil)
        skillsVC.arraySelectedItems = []
        skillsVC.arraySelectedItems.addObjects(from: arraySkills as! [Any])
        self.navigationController?.pushViewController(skillsVC, animated: true)
    }

    

    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSignUpClicked()
    {
//        let otpVC:OTPViewController = OTPViewController(nibName:"OTPViewController", bundle:nil)
//        self.navigationController?.pushViewController(otpVC, animated: true)
        if textAboutMe.text==""
        {
            invalidAbout()
        }
        else if textSkills.text==""
        {
        invalidSkills()
        }
        else if textInstruments.text==""
        {
        invalidInstruments()
        }
        else
        {
     //   ApiEditProfile()
            self.appDelegate.showHud(title: "Signing In...", sender: self.view)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                // do stuff 42 seconds later
                        let influenceVC:InfluencesViewController = InfluencesViewController(nibName:"InfluencesViewController", bundle:nil)
                        self.navigationController?.pushViewController(influenceVC, animated: true)
            }

        }
        
    }
    
    
    @IBAction func toolBarDoneClicked()
    {
        self.view.endEditing(true)
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
        cancelAbout()
        cancelSkills()
        cancelInstruments()
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
    
    
    
    
    
     
       
    

    func ApiEditProfile()
    {
        
        
        self.appDelegate.showHud(title: "Signing In...", sender: self.view)

        let urlString = "/api/updateProfile"
        
        
        
        
        
        let parameters = [
            "userId":UserDefaults.standard.value(forKey: "userid") as Any,
            "about":textAboutMe.text!,
            "skills":arraySkills!,
            "instruments":arrayInstruments!,
            "isPicture":"1",
            "location":UserDefaults.standard.value(forKey: "currentCity") as Any,
            "name":UserDefaults.standard.value(forKey: "") as Any,
            "deviceType":kConstant.Constants.via,
            "lat":UserDefaults.standard.value(forKey: "lat") as Any,
            "long":UserDefaults.standard.value(forKey: "long") as Any,
]
        
        
        let headers: HTTPHeaders = HttpApiModel().header()
        
        let profileImage = UIImageJPEGRepresentation(imageProfile.image!, 0.9)
        
        
        Alamofire.upload(multipartFormData:{ multipartFormData in
            multipartFormData.append(profileImage!, withName: "photo", fileName: "photo", mimeType: "image/jpeg")
            multipartFormData.append((UserDefaults.standard.value(forKey: "userid") as! String).data(using: String.Encoding.utf8)!, withName: "userId")
            multipartFormData.append(self.textAboutMe.text!.data(using: String.Encoding.utf8)!, withName: "about")
            multipartFormData.append(kConstant.Constants.appKey.data(using: String.Encoding.utf8)!, withName: "skills")
            multipartFormData.append("\(kConstant.Constants.apiVer)".data(using: .utf8)!, withName: "instruments")
            multipartFormData.append(kConstant.Constants.via.data(using: String.Encoding.utf8)!, withName: "isPicture")
            multipartFormData.append("\(kConstant.Constants.apiVer)".data(using: .utf8)!, withName: "location")
            multipartFormData.append("\(kConstant.Constants.apiVer)".data(using: .utf8)!, withName: "name")
            multipartFormData.append("\(kConstant.Constants.apiVer)".data(using: .utf8)!, withName: "deviceType")
            multipartFormData.append("\(kConstant.Constants.apiVer)".data(using: .utf8)!, withName: "lat")
            multipartFormData.append("\(kConstant.Constants.apiVer)".data(using: .utf8)!, withName: "long")

        },
                         usingThreshold:UInt64.init(),
                         to:kConstant.Constants.kBaseURL.appending(urlString),
                         method:.post,
                         headers:headers,
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload.responseJSON { response in
                                    debugPrint(response)
                                  //  CommonController.shared.hideHud()
                                }
                            case .failure(let encodingError):
                                print(encodingError)
                            }
        })
    }
    
    

        
        
//        let requestParam:Parameters = [
//            "userId":UserDefaults.standard.value(forKey: "userid") as Any,
//            "about":textAboutMe.text!,
//            "skills":arraySkills!,
//            "instruments":arrayInstruments!,
//            "isPicture":"1",
//            "location":UserDefaults.standard.value(forKey: "currentCity") as Any,
//            "name":UserDefaults.standard.value(forKey: "") as Any,
//            "deviceType":kConstant.Constants.via,
//            "lat":UserDefaults.standard.value(forKey: "lat") as Any,
//            "long":UserDefaults.standard.value(forKey: "long") as Any,
//            
//            ]
//        print("\(requestParam)")
//
//        Alamofire.upload(multipartFormData:
//            {
//                (multipartFormData) in
//                multipartFormData.append(UIImageJPEGRepresentation(self.imageProfile.image!, 0.1)!, withName: "photo", fileName: "photo.jpeg", mimeType: "image/jpeg")
//                for (key, value) in requestParam
//                {
//                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                }
//        }, to:kConstant.Constants.kBaseURL.appending(urlString),headers:nil)
//        { (result) in
//            switch result {
//            case .success(let upload,_,_ ):
//                upload.uploadProgress(closure: { (progress) in
//                    //Print progress
//                })
//                upload.responseJSON
//                    { response in
//                        //print response.result
//                        if response.response?.statusCode==200
//                        {
//                            let dict = response.result.value as! NSDictionary
//                            var theJSONText:String! = ""
//                            
//                            do {
//                                let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//                                // here "jsonData" is the dictionary encoded in JSON data
//                                
//                                theJSONText = NSString(data: jsonData!,
//                                                       encoding: String.Encoding.ascii.rawValue) as String!
//                            }
//                            
//                            print(theJSONText)
//                            
//                            
//                            let result = dict.object(forKey: "response") as! NSDictionary
//
//                        }
//                        else
//                        {
//                            self.appDelegate.showAlert(Title: response.result.value as? String ?? "errorMsg")
//                        }
//                        self.appDelegate.hideHud()
//
//
//                }
//            case .failure( _):
//                self.appDelegate.hideHud()
//
//                break
//            }   
//        }
        
   

}
    



