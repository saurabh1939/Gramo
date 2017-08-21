//
//  CreateEventViewController.swift
//  Jam Clan
//
//  Created by Wemo on 8/11/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire

class CreateEventViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout , UIImagePickerControllerDelegate , UINavigationControllerDelegate
{
    
    @IBOutlet var scrollMain:UIScrollView!
    @IBOutlet var viewName:UIView!
    @IBOutlet var viewDescription:UIView!
    @IBOutlet var viewEmail:UIView!
    @IBOutlet var viewLocation:UIView!
    @IBOutlet var viewPhone:UIView!
    @IBOutlet var viewWebsite:UIView!
    @IBOutlet var viewCoverPhoto:UIView!
    @IBOutlet var viewAddPhoto:UIView!
    @IBOutlet var viewStartDate:UIView!
    @IBOutlet var viewStartTime:UIView!
    @IBOutlet var viewEndDate:UIView!
    @IBOutlet var viewEndTime:UIView!
    @IBOutlet var viewServices:UIView!
    @IBOutlet var viewInstruments:UIView!
    @IBOutlet var viewHourCost:UIView!
    @IBOutlet var viewDayCost:UIView!
    @IBOutlet var viewAddPackage:UIView!
    @IBOutlet var viewBottom:UIView!
    @IBOutlet var buttonCreateStudio:UIButton!
    @IBOutlet var buttonAddPackage:UIButton!
    @IBOutlet var tablePackages:UITableView!
    
    @IBOutlet var textStudioName:UITextField!
    @IBOutlet var textDescripition:UITextField!
    @IBOutlet var textEmailId:UITextField!
    @IBOutlet var textClubLocation:UITextField!
    @IBOutlet var textPhoneNo:UITextField!
    @IBOutlet var textWebside:UITextField!
    @IBOutlet var textStdioServices:UITextField!
    @IBOutlet var textStudioInstruments:UITextField!
    @IBOutlet var textPerHourCost:UITextField!
    @IBOutlet var textPerDayCost:UITextField!
    
    
    
    @IBOutlet var toolBarKeyBoard: UIToolbar!
    @IBOutlet var buttonStudioName:UIButton!
    
    
    @IBOutlet var textEmail:UITextField!
    @IBOutlet var collectionviewCoverPhoto: UICollectionView!
    @IBOutlet var collectionviewAddPhoto: UICollectionView!
    
    var imageCoverArray:NSMutableArray!
    var imageAddPhotoArray:NSMutableArray!
    
    // Date Picker
    @IBOutlet var textfieldStartDate : UITextField!
    @IBOutlet var textfieldEndDate : UITextField!
    
    @IBOutlet var toolbar : UIToolbar!
    @IBOutlet var toolbarTime : UIToolbar!
    var datepicker = UIDatePicker()
    var components = DateComponents()
    let date = Date()
    var selecttedImage:Bool = false
    var selecttedDate:Bool = false
    var selecttedTime:Bool = false
    
    // Time Pocker
    @IBOutlet var textfieldStartTime: UITextField!
    @IBOutlet var textfieldEndTime: UITextField!
    let time_picker  = UIDatePicker()
    var time: String!
    var arrayAddPackage : NSMutableArray!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.imageCoverArray = []
        self.imageAddPhotoArray = []
        self.arrayAddPackage = []
        registerNib()
        setup()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if self.imageCoverArray.count > 0 {
            self.collectionviewCoverPhoto.scrollToItem(at: IndexPath(item:self.imageCoverArray.count-1 , section:0), at: .centeredHorizontally, animated: true)
        }
        
        if self.imageAddPhotoArray.count > 0 {
            self.collectionviewAddPhoto.scrollToItem(at: IndexPath(item:self.imageAddPhotoArray.count-1 , section:0), at: .centeredHorizontally, animated: true)
        }
        
        // imageAddPhotoArray
    }
    func registerNib()
    {
        let nibName = UINib(nibName: "AddPackageTableViewCell", bundle:nil)
        tablePackages.register(nibName, forCellReuseIdentifier: "Cell")
        
        let nibNameCollectionCheck=UINib(nibName:"CoverPhotoViewCell", bundle:nil)
        collectionviewCoverPhoto.register(nibNameCollectionCheck, forCellWithReuseIdentifier:"cell")
        collectionviewAddPhoto.register(nibNameCollectionCheck, forCellWithReuseIdentifier:"cell")
        
    }
    
    
    
    func setup()
    {
        viewName.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 75)
        viewDescription.frame=CGRect(x: 0, y:viewName.frame.origin.y + viewName.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 75)
        viewEmail.frame=CGRect(x: 0, y:viewDescription.frame.origin.y + viewDescription.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 75)
        viewLocation.frame=CGRect(x: 0, y:viewEmail.frame.origin.y + viewEmail.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 75)
        viewPhone.frame=CGRect(x: 0, y:viewLocation.frame.origin.y + viewLocation.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 75)
        viewWebsite.frame=CGRect(x: 0, y:viewPhone.frame.origin.y + viewPhone.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 75)
        viewCoverPhoto.frame=CGRect(x: 0, y:viewWebsite.frame.origin.y + viewWebsite.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 100)
        viewAddPhoto.frame=CGRect(x: 0, y:viewCoverPhoto.frame.origin.y + viewCoverPhoto.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 100
        )
        
        viewStartDate.frame=CGRect(x: 0, y:viewAddPhoto.frame.origin.y + viewAddPhoto.frame.size.height + 2, width: UIScreen.main.bounds.width/2, height: 75)
        viewStartTime.frame=CGRect(x: UIScreen.main.bounds.width/2+2, y:viewAddPhoto.frame.origin.y + viewAddPhoto.frame.size.height + 2, width: UIScreen.main.bounds.width/2, height: 75)
        
        viewEndDate.frame=CGRect(x: 0, y:viewStartDate.frame.origin.y + viewStartDate.frame.size.height + 2, width: UIScreen.main.bounds.width/2, height: 75)
        viewEndTime.frame=CGRect(x: UIScreen.main.bounds.width/2+2, y:viewStartDate.frame.origin.y + viewStartDate.frame.size.height + 2, width: UIScreen.main.bounds.width/2, height: 75)
        
        viewServices.frame=CGRect(x: 0, y:viewEndDate.frame.origin.y + viewEndDate.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 75)
        viewInstruments.frame=CGRect(x: 0, y:viewServices.frame.origin.y + viewServices.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 75)
        
        viewHourCost.frame=CGRect(x: 0, y:viewInstruments.frame.origin.y + viewInstruments.frame.size.height + 2, width: UIScreen.main.bounds.width/2, height: 75)
        viewDayCost.frame=CGRect(x: UIScreen.main.bounds.width/2+2, y:viewInstruments.frame.origin.y + viewInstruments.frame.size.height + 2, width: UIScreen.main.bounds.width/2, height: 75)
        
        viewAddPackage.frame=CGRect(x: 0, y:viewDayCost.frame.origin.y + viewDayCost.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 160)
        viewBottom.frame=CGRect(x: 0, y:viewAddPackage.frame.origin.y + viewAddPackage.frame.size.height + 2, width: UIScreen.main.bounds.width, height: 135)
        
        scrollMain.contentSize=CGSize(width: 0, height: viewBottom.frame.origin.y+viewBottom.frame.size.height)
        buttonCreateStudio.layer.cornerRadius=buttonCreateStudio.frame.size.height/2;
        
        
        
        //textStudioName.attributedPlaceholder = NSAttributedString(string: textStudioName.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.clear])
        
        //  textDescripition.attributedPlaceholder = NSAttributedString(string: textDescripition.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        //  textEmailId.attributedPlaceholder = NSAttributedString(string: textEmailId.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        //  textClubLocation.attributedPlaceholder = NSAttributedString(string: textClubLocation.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        //  textPhoneNo.attributedPlaceholder = NSAttributedString(string: textPhoneNo.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        //  textWebside.attributedPlaceholder = NSAttributedString(string: textWebside.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        // textStdioServices.attributedPlaceholder = NSAttributedString(string: textStdioServices.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        // textStudioInstruments.attributedPlaceholder = NSAttributedString(string: textStudioInstruments.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        // textPerHourCost.attributedPlaceholder = NSAttributedString(string: textPerHourCost.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        // textPerDayCost.attributedPlaceholder = NSAttributedString(string: textPerDayCost.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        
        textStudioName.inputAccessoryView = toolBarKeyBoard
        textDescripition.inputAccessoryView = toolBarKeyBoard
        textEmailId.inputAccessoryView = toolBarKeyBoard
        textClubLocation.inputAccessoryView = toolBarKeyBoard
        textPhoneNo.inputAccessoryView = toolBarKeyBoard
        textWebside.inputAccessoryView = toolBarKeyBoard
        
        textStdioServices.inputAccessoryView = toolBarKeyBoard
        textStudioInstruments.inputAccessoryView = toolBarKeyBoard
        
        textPerHourCost.inputAccessoryView = toolBarKeyBoard
        textPerDayCost.inputAccessoryView = toolBarKeyBoard
        
        
    }
    func invalidStudioName()
    {
        buttonStudioName.isHidden=false
    }
    
    func cancelStudioName()
    {
        textStudioName.textColor=UIColor.white
        buttonStudioName.isHidden=true
    }
    
    @IBAction func buttonStudioNameCrossClicked()
    {
        cancelStudioName()
        textStudioName.text=""
        
    }
    
    //    func cancelStudioName()
    //    {
    //        textStudioName.textColor=UIColor.white
    //        buttonStudioName.isHidden=true
    //    }
    //
    //    @IBAction func buttonStudioNameCrossClicked()
    //    {
    //        cancelStudioName()
    //        textStudioName.text=""
    //
    //    }
    
    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonAddPackageClicked()
    {
        
    }
    
    @IBAction func buttonCreateStudioClicked()
    {
    }
    
    @IBAction func toolBarDoneClicked()
    {
        self.view.endEditing(true)
    }
    
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tablePackages.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AddPackageTableViewCell
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        let studioDetail : StudioDetailViewController = StudioDetailViewController(nibName:"StudioDetailViewController", bundle:nil)
        self.navigationController?.pushViewController(studioDetail, animated: true)
        
    }
    
    
    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -200, up: true)
    }
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        moveTextField(textField, moveDistance: -200, up: false)
    }
    //textfield moving up with keyboard
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool)
    {
        
        let moveDuration = 0.3
        
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(moveDuration)
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        
        UIView.commitAnimations()
        
    }
    @IBAction func buttonStartDateclicked(){
        selecttedDate = true
        self.datepicker.isHidden = false
        self.toolbar.isHidden = false
        self.createDatePicker()
        
    }
    @IBAction func buttonEndDateclicked(){
        selecttedDate = false
        self.datepicker.isHidden = false
        self.toolbar.isHidden = false
        self.createDatePicker()
        
    }
    @IBAction func buttonStartTimeclicked()
    {
        selecttedTime = true
        self.datepicker.isHidden = false
        self.toolbarTime.isHidden = false
        self.createTimePicker()
    }
    
    @IBAction func buttonEndTimeclicked()
    {
        selecttedTime = false
        self.datepicker.isHidden = false
        self.toolbarTime.isHidden = false
        self.createTimePicker()
    }
    
    
    // Collection View Method:
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionviewCoverPhoto {
            
            return  self.imageCoverArray.count + 1
        }
        else
        {
            return  self.imageAddPhotoArray.count + 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CoverPhotoViewCell
        
        if indexPath.row == 0
        {
            cell.imageCoverPhoto.isHidden = true
            cell.imageCoverPhoto.layer.cornerRadius = 5;
            cell.imageCoverPhoto.layer.masksToBounds = true;
            cell.buttonCross.isHidden = true
        }
        else
        {
            //            cell.buttonCross.layer.cornerRadius = cell.buttonCross.frame.height/2
            //            cell.imageCoverPhotoPlus.isHidden = true
            //            cell.labelPlus.isHidden = true
            //            cell.imageCoverPhotoPlus.layer.cornerRadius = 5;
            //            cell.imageCoverPhotoPlus.layer.masksToBounds = true;
            if collectionView == collectionviewCoverPhoto {
                
                if self.imageCoverArray.count > 0 && indexPath.row < self.imageCoverArray.count {
                    cell.imageCoverPhotoPlus.image = UIImage(data: self.imageCoverArray.object(at: indexPath.row ) as! Data)
                    cell.imageCoverPhotoPlus.layer.cornerRadius = 5.0
                }
            }
            else
            {
                if self.imageAddPhotoArray.count > 0 && indexPath.row < self.imageAddPhotoArray.count {
                    cell.imageCoverPhotoPlus.image = UIImage(data: self.imageAddPhotoArray.object(at: indexPath.row ) as! Data)
                    cell.imageCoverPhotoPlus.layer.cornerRadius = 5.0
                }
            }
            
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionviewCoverPhoto {
            if !(self.imageCoverArray.count > 0) || (indexPath.row == self.imageCoverArray.count) {
                if self.imageCoverArray.count == 5 {
                    let alert = UIAlertController(title: "You can upload up to 5 images.", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let okActionButton = UIAlertAction(title: "OK", style: .default) { action -> Void in
                    }
                    alert.addAction(okActionButton)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    selecttedImage = true
                    self.openAlertPopup()
                }
            }
        }
        else
        {
            if !(self.imageAddPhotoArray.count > 0) || (indexPath.row == self.imageAddPhotoArray.count) {
                if self.imageAddPhotoArray.count == 5 {
                    let alert = UIAlertController(title: "You can upload up to 5 images.", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let okActionButton = UIAlertAction(title: "OK", style: .default) { action -> Void in
                    }
                    alert.addAction(okActionButton)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    selecttedImage = false
                    self.openAlertPopup()
                }
            }
        }
        
    }
    
    
    func openAlertPopup(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let sendButton = UIAlertAction(title: "From Camera", style: .default, handler: { (action) -> Void in
            print("camera button tapped")
            self.openCameraButton(sender: action)
        })
        let  deleteButton = UIAlertAction(title: "From Photo Library", style: .default, handler: { (action) -> Void in
            print("gallery button tapped")
            self.openPhotoLibraryButton(sender: action)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        alertController.addAction(sendButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }
    func openCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
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
            let imageView = UIImageView()
            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            let imgData:NSData = UIImageJPEGRepresentation(imageView.image!, 0.50)! as NSData
            if selecttedImage == true {
                self.imageCoverArray.add(imgData)
                self.collectionviewCoverPhoto.reloadData()
            }
            else
            {
                self.imageAddPhotoArray.add(imgData)
                self.collectionviewAddPhoto.reloadData()
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    //// Date Picker:
    
    func createDatePicker(){
        //format for picker
        datepicker.datePickerMode = .date
        self.datepicker.frame = CGRect(x: 0, y: 500, width: self.view.frame.size.width, height: 200)
        datepicker.backgroundColor = UIColor.white
        self.view.addSubview(datepicker)
        toolbarpopup()
        
    }
    func createTimePicker(){
        //format for picker
        datepicker.datePickerMode = .time
        self.datepicker.frame = CGRect(x: 0, y: 500, width: self.view.frame.size.width, height: 200)
        datepicker.backgroundColor = UIColor.white
        self.view.addSubview(datepicker)
        toolbarpopup1()
        
    }
    
    func toolbarpopup(){
        view.addSubview(toolbar)
        self.toolbar.frame = CGRect(x: 0, y: 470, width: self.view.frame.size.width, height: 30)
    }
    func toolbarpopup1(){
        view.addSubview(toolbarTime)
        self.toolbarTime.frame = CGRect(x: 0, y: 470, width: self.view.frame.size.width, height: 30)
    }
    @IBAction func donePressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let convertedDate = dateFormatter.string(from: datepicker.date)
        
        if selecttedDate == true {
            textfieldStartDate.text = "\(convertedDate)"
        }
        else
        {
            textfieldEndDate.text = "\(convertedDate)"
        }
        
        self.datepicker.isHidden = true
        self.toolbar.isHidden = true
    }
    
    @IBAction func cancelPressed(){
        textfieldStartDate.text = ""
        self.datepicker.isHidden = true
        self.toolbar.isHidden = true
        selecttedDate = false
        // self.view.endEditing(true)
        
    }
    
    @IBAction func doneTimePressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "HH:mm a"
        let convertedDate = dateFormatter.string(from: datepicker.date)
        
        if selecttedTime == true {
            textfieldStartTime.text = "\(convertedDate)"
        }
        else
        {
            textfieldEndTime.text = "\(convertedDate)"
        }
        
        self.datepicker.isHidden = true
        self.toolbarTime.isHidden = true
    }
    
    @IBAction func cancelTimePressed(){
        textfieldStartTime.text = ""
        self.datepicker.isHidden = true
        self.toolbarTime.isHidden = true
        selecttedDate = false
        // self.view.endEditing(true)
        
    }
    
    
}
