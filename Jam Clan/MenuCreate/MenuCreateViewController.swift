//
//  MenuCreateViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 12/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MenuCreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonBackClicked()
    {
    self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func buttonCreateStudioClicked()
    {
        let createStudioVC : CreateStudioViewController = CreateStudioViewController(nibName:"CreateStudioViewController", bundle:nil)
        self.navigationController?.pushViewController(createStudioVC, animated: true)
    }
    
    
    @IBAction func buttonCreateEventClicked()
    {
        let createEvent : CreateEventViewController = CreateEventViewController(nibName:"CreateEventViewController", bundle:nil)
        self.navigationController?.pushViewController(createEvent, animated: true)
    }

    
    @IBAction func buttonCreateBandClicked()
    {
        let createBandVC : CreateBandViewController = CreateBandViewController(nibName:"CreateBandViewController", bundle:nil)
        self.navigationController?.pushViewController(createBandVC, animated: true)
    }

    
    

}
