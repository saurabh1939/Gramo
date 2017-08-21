//
//  WebViewViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 12/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {
    
    var strWillAppear = NSString()
    @IBOutlet var labelTitle:UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   func setup()
    {
    if strWillAppear=="policy"
    {
        labelTitle.text="Privacy Policy"
        }
        else
    {
        labelTitle.text="Terms and Conditions"
        }
    }
    
    
    @IBAction func buttonBackClicked()
    {
    self.navigationController?.popViewController(animated: true)
    }
    
}
