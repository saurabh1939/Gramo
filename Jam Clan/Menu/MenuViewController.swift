//
//  MenuViewController.swift
//  4sFoods
//
//  Created by SAMEER KHAN on 21/06/16.
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
    @IBOutlet var labelWalletAmount:UILabel!
    
    @IBOutlet var imageVW:UIImageView!
    @IBOutlet var tableVW:UITableView!
    @IBOutlet var buttonBackground:UIButton!
    
    var arrayMenuName : NSMutableArray = ["Home","Save Holiday","Change Password","Legal","Logout"]
    
    var arrayMenuImages : NSMutableArray = ["home","myprofile","changepassword","ic_legal","logout"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setImageView()
        self.setValuesOnLabels()
        
        // Do any additional setup after loading the view.
        
        let nibName = UINib(nibName: "MenuTableViewCell", bundle:nil)
        self.tableVW.register(nibName, forCellReuseIdentifier: "Cell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(_:)), name:NSNotification.Name(rawValue: "menuupdate"), object: nil)
        labelUserName.text = (UserDefaults.standard.value(forKey: "fullname")!) as? String
        
        imageVW.layer.cornerRadius = imageVW.frame.height / 2.0
        imageVW.layer.borderColor = UIColor.white.cgColor
        imageVW.layer.masksToBounds = true
        
        if ((UserDefaults.standard.value(forKey: "pic") != nil)){
            
        print("http://iclinic.city/docimg/\(UserDefaults.standard.value(forKey: "pic")!)")
            
       // imageVW.image = UIImage(named: ("http://iclinic.city/docimg/\(UserDefaults.standard.value(forKey: "pic")!)"))
            
            let url = NSURL(string:"http://iclinic.city/docimg/\(UserDefaults.standard.value(forKey: "pic")!)")
            let data = NSData(contentsOf:url! as URL)
            imageVW.image = UIImage(data:data! as Data)
            
            }
        else
        {
            imageVW.image = UIImage(named: "UserDefaultImage.png")
        }
        
        self.updateAmount()
    }

    func methodOfReceivedNotification(_ notification: Notification)
    {
        //Take Action on Notification
        self.setValuesOnLabels()
        self.updateAmount()
    }
    
    func updateAmount()
    {
        if UserDefaults.standard.value(forKey: "wallet") != nil
        {

        self.labelWalletAmount.text = String(format: "₹ %d in Wallet",UserDefaults.standard.value(forKey: "wallet") as! NSInteger)
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setImageView()
    {
        imageVW.layer.cornerRadius = imageVW.frame.size.width/2;
        imageVW.layer.borderWidth = 2.0
        imageVW.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setValuesOnLabels()
    {
        if (UserDefaults.standard.value(forKey: "username") != nil)
        {
            labelUserName.text = UserDefaults.standard.value(forKey: "username") as? String
            
        }
        if (UserDefaults.standard.value(forKey: "userlocality") != nil&&UserDefaults.standard.value(forKey: "usercity") != nil)
        {
            
            labelUserLocality_city.text = String(format: "%@, %@",(UserDefaults.standard.value(forKey: "userlocality") as! String) , (UserDefaults.standard.value(forKey: "usercity") as! String))
        }
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
    
    //MARK: TABLEVIEW DELEGATES
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayMenuName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableVW.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.labelName.text = arrayMenuName[indexPath.row] as? String
        cell.imageVW.image = UIImage(named: self.arrayMenuImages[indexPath.item] as! String)
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        delegate?.menuClicked(indexPath.row)
    }
}
