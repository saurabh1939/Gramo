//
//  CreateBandViewController.swift
//  Jam Clan
//
//  Created by Wemo on 8/11/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class CreateBandViewController: UIViewController {
    @IBOutlet var buttonCreateBand:UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setup()
    {
        buttonCreateBand.layer.cornerRadius=buttonCreateBand.frame.size.height/2;


    }
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }

    

}
