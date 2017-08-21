//
//  FollowerViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/06/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class FollowerViewController: UIViewController {

    @IBOutlet var tableFollowers:UITableView!
    @IBOutlet var labelTitle:UILabel!

    var strWillAppear = NSString()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.registerNib()
        // Do any additional setup after loading the view.
        
        if strWillAppear.isEqual(to: "follower")
        {
            labelTitle.text="Followers"
        }
       else if strWillAppear.isEqual(to: "likes")
        {
            labelTitle.text="Likes"
        }
        else
        {
         labelTitle.text="Following"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "FollowerTableViewCell", bundle:nil)
        tableFollowers.register(nibName, forCellReuseIdentifier: "Cell")
        
    }
    
    
    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }


    

    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FollowerTableViewCell
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        
    }


}
