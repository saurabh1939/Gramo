//
//  NotificationViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 13/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var tableNotifications:UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerNib()
    }
    
    func registerNib()
    {
        let nibName = UINib(nibName: "FeedNotificationsTableViewCell", bundle:nil)
        tableNotifications.register(nibName, forCellReuseIdentifier: "Cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonMenuClicked()
    {
        appDelegate.showMenu()
    }
    

    // Table View Method :
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedNotificationsTableViewCell
        cell.imageProfile.layer.cornerRadius=cell.imageProfile.frame.size.height/2
        cell.imageProfile.layer.borderWidth=2.0
        cell.imageProfile.layer.borderColor=UIColor.white.cgColor
        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }


}
