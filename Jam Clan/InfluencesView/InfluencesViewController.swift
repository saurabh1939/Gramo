//
//  InfluencesViewController.swift
//  Jam Clan
//
//  Created by Wemo on 8/11/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class InfluencesViewController: UIViewController {
    @IBOutlet var tableInfluences:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
  self.registerNib()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerNib()
    {
        let nibName = UINib(nibName: "InfluencesViewCell", bundle:nil)
        tableInfluences.register(nibName, forCellReuseIdentifier: "Cell")
    }
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSkipClicked()
    {
                let otpVC:OTPViewController = OTPViewController(nibName:"OTPViewController", bundle:nil)
                self.navigationController?.pushViewController(otpVC, animated: true)

    }

    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableInfluences.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InfluencesViewCell
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
//        let studioDetail : StudioDetailViewController = StudioDetailViewController(nibName:"StudioDetailViewController", bundle:nil)
//        self.navigationController?.pushViewController(studioDetail, animated: true)
        
    }


}
