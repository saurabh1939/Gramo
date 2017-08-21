//
//  FundHistoryViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 13/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class FundHistoryViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var strWillAppear = NSString()

    @IBOutlet var labelTitle:UILabel!
    @IBOutlet var tableHistory:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerNib()
        setup()
        
    }
    
    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "HistoryTableViewCell", bundle:nil)
        tableHistory.register(nibName, forCellReuseIdentifier: "Cell")
        
        
    }
    
    func setup()
    {
        if strWillAppear=="user"
        {
            labelTitle.text="Payment History"
        }
        else
        {
        labelTitle.text="Fund History"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonMenuClicked()
    {
        appDelegate.showMenu()
    }


    
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
        let cell = tableHistory.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableViewCell
        
        if indexPath.row==0
        {
            cell.imageTopLine.isHidden=true
        }
       else if indexPath.row==4
        {
            cell.imageBottomLine.isHidden=true
        }

        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        
        
    }

}
