//
//  FeedBookmarkViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 31/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class FeedBookmarkViewController: UIViewController {

    @IBOutlet weak var tableBookmarkAll:UITableView!
    
    
    
    let floraButton = PDFloraButton(withPosition: .bottomRight, size: 70.0, numberOfPetals: 4, images:["commma.png","instagram.png","post-img-icon.png","video-icon.png"])
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        
        floraButton.setImage(UIImage(named: "addfeed.png"), for: UIControlState())
        
        self.view.addSubview(floraButton)
        
        
        floraButton.buttonActionDidSelected = { (indexSelected) in
            debugPrint("Selected Index: \(indexSelected)")
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func registerNib()
    {
        let nibName = UINib(nibName: "FeedBookmarkTableViewCell", bundle:nil)
        tableBookmarkAll.register(nibName, forCellReuseIdentifier: "Cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func buttonNotificationClicked()
    {
        let feedNotiVC : FeedNotificationsViewController = FeedNotificationsViewController(nibName:"FeedNotificationsViewController", bundle:nil)
        self.navigationController?.pushViewController(feedNotiVC, animated: false)
        
    }
    
    @IBAction func buttonFeedClicked()
    {
        let feedHomeVC : HomeFeedsViewController = HomeFeedsViewController(nibName:"HomeFeedsViewController", bundle:nil)
        self.navigationController?.pushViewController(feedHomeVC, animated: false)
        
    }
    
    @IBAction func buttonProfileClicked()
    {
        let feedProfileVC : FeedProfileViewController = FeedProfileViewController(nibName:"FeedProfileViewController", bundle:nil)
        self.navigationController?.pushViewController(feedProfileVC, animated: false)

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedBookmarkTableViewCell
        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }



}
