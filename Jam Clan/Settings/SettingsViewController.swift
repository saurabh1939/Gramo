//
//  SettingsViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 12/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet var tableSettings:UITableView!
    var arrayItems : NSMutableArray = ["Push Notifications","Change Password","Invite Friends","Rate Our App","Terms and Conditions","Privacy Policy"]



    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerNib()
        
    }

    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "SettingsTableViewCell", bundle:nil)
        tableSettings.register(nibName, forCellReuseIdentifier: "Cell")
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func inviteFriends()
    {
        let objectsToShare = ["My text", URL(string: "http://www.google.com") ] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
     //   activityVC.excludedActivityTypes = [UIActivityType.addToReadingList, UIActivityType.postToVimeo, UIActivityType.print, UIActivityType.saveToCameraRoll]
        
     //   activityVC.popoverPresentationController?.sourceView = sender
        self.present(activityVC, animated: true, completion: nil)
    }

    @IBAction func buttonMenuClicked()
    {
        appDelegate.showMenu()
    }
    
    
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItems.count
    }
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableSettings.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SettingsTableViewCell

        if indexPath.row==0
        {
            cell.switchPush.isHidden=false
            cell.imageArrow.isHidden=true
        }
        else
        {
            cell.switchPush.isHidden=true
            cell.imageArrow.isHidden=false

        }
        cell.labelName.text=arrayItems[indexPath.row] as? String
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        if indexPath.row==1
        {
            let changePasswordVC : ChangePasswordViewController = ChangePasswordViewController(nibName:"ChangePasswordViewController", bundle:nil)
            self.navigationController?.pushViewController(changePasswordVC, animated: true)

        }
        else if indexPath.row==2
        {
            inviteFriends()
        }
        else if indexPath.row==4
        {
            let webViewVC : WebViewViewController = WebViewViewController(nibName:"WebViewViewController", bundle:nil)
            webViewVC.strWillAppear="conditions"
            self.navigationController?.pushViewController(webViewVC, animated: true)
        }
        else if indexPath.row==5
        {
            let webViewVC : WebViewViewController = WebViewViewController(nibName:"WebViewViewController", bundle:nil)
            webViewVC.strWillAppear="policy"
            self.navigationController?.pushViewController(webViewVC, animated: true)
        }
        
    }
    

}
