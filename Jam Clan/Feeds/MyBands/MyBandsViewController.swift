//
//  MyBandsViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/06/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MyBandsViewController: UIViewController {
    
    @IBOutlet weak var tableMyBand:UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
           registerNib()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNib()
    {
        let nibName = UINib(nibName: "MyBandTableViewCell", bundle:nil)
        tableMyBand.register(nibName, forCellReuseIdentifier: "Cell")
        
    }
    

    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyBandTableViewCell
               
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    

    

}
