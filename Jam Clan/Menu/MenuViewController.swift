//
//  MenuViewController.swift
//  4sFoods
//
//  Created by Saurabh Singh Rathore on 21/06/16.
//  Copyright © 2016 wemo. All rights reserved.
//

import UIKit

protocol Menu:class
{
    func menuClicked(_ index:Int)
}

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    var delegate:Menu?
    

    
    @IBOutlet var viewHeader:UIView!
    @IBOutlet var labelUserName:UILabel!
    @IBOutlet var labelUserLocality_city:UILabel!
    @IBOutlet var labelSwitchText:UILabel!

    
    @IBOutlet var imageVW:UIImageView!
    @IBOutlet var imageOwner:UIImageView!
    @IBOutlet var imageBackground:UIImageView!


    @IBOutlet var tableVW:UITableView!
    @IBOutlet var buttonBackground:UIButton!
    @IBOutlet var buttonSwitch:UIButton!
    
    var strProfileType = NSString()


    
    var arrayMenuName : NSMutableArray = ["Create","Home","Notifications","Messages","My Favourites","My Bookings","Merchandise","Payment History"]
    
    var arrayMenuImages : NSMutableArray = ["edit","home","notification","messages","favourites","bookings","merchandise","payment"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
        
        let nibName = UINib(nibName: "MenuTableViewCell", bundle:nil)
        self.tableVW.register(nibName, forCellReuseIdentifier: "Cell")
        
        imageVW.layer.cornerRadius = imageVW.frame.height / 2.0
        imageVW.layer.borderColor = UIColor.white.cgColor
        imageVW.layer.masksToBounds = true
        strProfileType="user"
        
    }


    
    //MARK: IBACTIONS
    
    @IBAction
    func buttonBackgroundClicked()
    {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations:
            {
                 self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            }, completion: nil)
        
        
      
    }
    
    
    
    
    @IBAction func buttonSwitchClicked()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        if strProfileType=="user"
        {
            appDelegate.isOwner=true
            arrayMenuName.removeAllObjects()
            arrayMenuImages.removeAllObjects()
            arrayMenuName = ["Create","Booking Requests","Notifications","Messages","Studios","Events","Bands","Fund History"]
            arrayMenuImages = ["edit","home","notification","messages","studios-sidemenu","events-sidemenu","bands-sidemenu","payment"]
            strProfileType="owner"
            labelSwitchText.text="Switch to User"
            imageVW.image=UIImage(named:"switchtowoner.png")
            imageOwner.image=UIImage(named:"side-menu-profile.png")
            imageBackground.image=UIImage(named:"slider-uper")



        }
        else
        {
            appDelegate.isOwner=false
            arrayMenuName.removeAllObjects()
            arrayMenuImages.removeAllObjects()
            arrayMenuName = ["Create","Home","Notifications","Messages","My Favourites","My Bookings","Merchandise","Payment History"]
            arrayMenuImages = ["edit","home","notification","messages","favourites","bookings","merchandise","payment"]
            strProfileType="user"
            labelSwitchText.text="Switch to Owner"
            imageVW.image=UIImage(named:"side-menu-profile.png")
            imageOwner.image=UIImage(named:"switchtowoner.png")
            imageBackground.image=UIImage(named:"side-menu-img.png")



        }
        tableVW.reloadData()

    }
    
    func buttonLogoutclicked(sender:UIButton)
    {
        let alert = UIAlertController(title: "Logout", message: "Are you sure to Logout?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)

    }
    
    
    //MARK: TABLEVIEW DELEGATES
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayMenuName.count+1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableVW.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.labelLine.isHidden=true
        cell.viewBottom.isHidden=true
        cell.buttonLogout.isHidden=true
        if indexPath.row==0||indexPath.row==7
        {
            cell.labelLine.isHidden=false

        }

        if indexPath.row<arrayMenuName.count
        {
            cell.labelName.text = arrayMenuName[indexPath.row] as? String
            cell.imageVW.image = UIImage(named: self.arrayMenuImages[indexPath.item] as! String)

        }
        else
        {
        cell.viewBottom.isHidden=false
        }
        if indexPath.row==8
        {
            cell.buttonLogout.isHidden=false

        }
        cell.buttonLogout.addTarget(self,action:#selector(buttonLogoutclicked(sender:)), for: .touchUpInside)

        cell.selectionStyle=UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
       if indexPath.row==0||indexPath.row==7
       {
        return 70
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        if indexPath.row != 8
//        {
        delegate?.menuClicked(indexPath.row)
     //   }
    }
}
