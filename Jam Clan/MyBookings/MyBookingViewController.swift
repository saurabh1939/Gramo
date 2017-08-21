//
//  MyBookingViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 13/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MyBookingViewController: UIViewController {
    @IBOutlet var tableEvents : UITableView!
    @IBOutlet var tableMusiccity : UITableView!
    @IBOutlet var tableStudios : UITableView!
    
    @IBOutlet var viewTop:UIView!
    @IBOutlet var viewNav:UIView!

    
    @IBOutlet var buttonEvents : UIButton!
    @IBOutlet var buttonMusiccity : UIButton!
    @IBOutlet var buttonStudios : UIButton!
    
    @IBOutlet var imageButtonselection : UIImageView!
    @IBOutlet var scrollTables : UIScrollView!
    var cancelmessage : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        scrollTables.frame=CGRect(x: 0, y: 114, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-114)

        scrollTables.contentSize = CGSize(width: UIScreen.main.bounds.width*3, height: 0)
        viewNav.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)

        viewTop.frame=CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 50)
        buttonEvents.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/3, height: 50)
         buttonMusiccity.frame=CGRect(x: buttonEvents.frame.origin.x+buttonEvents.frame.size.width, y: 0, width: UIScreen.main.bounds.width/3, height: 50)
        buttonStudios.frame=CGRect(x: buttonMusiccity.frame.origin.x+buttonMusiccity.frame.size.width, y: 0, width: UIScreen.main.bounds.width/3, height: 50)
        imageButtonselection.frame = CGRect(x: 0, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        
        tableEvents.frame = CGRect(x: 0, y: 0 , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (self.viewTop.frame.height + self.viewNav.frame.height)
        )
        tableMusiccity.frame = CGRect(x: UIScreen.main.bounds.width, y: 0  , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (self.viewTop.frame.height + self.viewNav.frame.height)

        )
        tableStudios.frame = CGRect(x: UIScreen.main.bounds.width*2, y: 0 , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (self.viewTop.frame.height + self.viewNav.frame.height)
        )
        tableEvents.tag = 1


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerNib()
    {
        
        let nibName = UINib(nibName: "MyBookingTableViewCell", bundle:nil)
        tableEvents.register(nibName, forCellReuseIdentifier: "Cell")
        tableMusiccity.register(nibName, forCellReuseIdentifier: "Cell")
        tableStudios.register(nibName, forCellReuseIdentifier: "Cell")
        
        
       
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
        
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyBookingTableViewCell
        cell.buttonCancel.tag = indexPath.row
                cell.buttonCancel.addTarget(self,action:#selector(buttonCancelclicked(sender:)), for: .touchUpInside)
        
        return cell
        
    }
    func buttonCancelclicked(sender:UIButton){
         if tableEvents.tag == 1{
            cancelmessage = "Are you sure to cancel this event"
         }else if tableEvents.tag == 2 {
             cancelmessage = "Are you sure to cancel music city"
         }else if tableEvents.tag == 3 {
        cancelmessage = "Are you sure to leave the studio"
        }

        let alert = UIAlertController(title: "Cancel", message: "\(cancelmessage)", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
     
    }
    @IBAction func buttonEventclicked()
    {
    scrollTables.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
     imageButtonselection.frame = CGRect(x: 0, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        tableEvents.tag = 1
        
    }
    @IBAction func buttonMusiccityclicked()
    {
        scrollTables.setContentOffset(CGPoint(x: UIScreen.main.bounds.width, y: 0), animated: true)
        
           imageButtonselection.frame = CGRect(x: buttonEvents.frame.origin.x+buttonEvents.frame.size.width, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        tableEvents.tag = 2
        
    }
    @IBAction func buttonStudiosclicked()
    {
        scrollTables.setContentOffset(CGPoint(x: UIScreen.main.bounds.width*2, y: 0), animated: true)
        

         imageButtonselection.frame = CGRect(x: buttonMusiccity.frame.origin.x+buttonMusiccity.frame.size.width, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        tableEvents.tag = 3
        
        
    }


    



}
