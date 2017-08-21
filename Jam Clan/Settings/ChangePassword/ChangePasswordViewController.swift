//
//  ChangePasswordViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 12/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    
    @IBOutlet var buttonbuttonDone:UIButton!

    @IBOutlet var buttonOldPass:UIButton!
    @IBOutlet var buttonNewPass:UIButton!
    @IBOutlet var buttonConfirmPass:UIButton!

    
    @IBOutlet var textOldPass:FloatLabelTextField!
    @IBOutlet var textNewPass:FloatLabelTextField!
    @IBOutlet var textConfirmPass:FloatLabelTextField!

    
    @IBOutlet var imageLineOldPass:UIImageView!
    @IBOutlet var imageLineNewPass:UIImageView!
    @IBOutlet var imageLineConfirmPass:UIImageView!



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonBackClicked()
    {
    self.navigationController?.popViewController(animated: true)
    }
    

    func setup()
    {
        
        textOldPass.attributedPlaceholder = NSAttributedString(string: textOldPass.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.darkGray])
        textNewPass.attributedPlaceholder = NSAttributedString(string: textNewPass.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.darkGray])
        textConfirmPass.attributedPlaceholder = NSAttributedString(string: textConfirmPass.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.darkGray])

        
        
    }


}
