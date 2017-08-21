//
//  MyFeedsViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/06/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MyFeedsViewController: UIViewController {
    
    @IBOutlet weak var tableMyFeed:UITableView!


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
        let nibName = UINib(nibName: "MyFeedsTableViewCell", bundle:nil)
        tableMyFeed.register(nibName, forCellReuseIdentifier: "Cell")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyFeedsTableViewCell
        cell.imageProfile.layer.cornerRadius=cell.imageProfile.frame.size.height/2
        cell.imageProfile.layer.borderWidth=2.0
        cell.imageProfile.layer.borderColor=UIColor.white.cgColor
        
        
        cell.buttonMore.tag = indexPath.row
        cell.buttonMore.addTarget(self, action: #selector(self.buttonMoreClicked(_:)), for: .touchDown)
        
        cell.buttonLikeCounts.tag = indexPath.row
        cell.buttonLikeCounts.addTarget(self, action: #selector(self.buttonLikesCountClicked(_:)), for: .touchDown)
        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    
    
    
    func buttonLikesCountClicked(_ sender: UIButton!)
    {
        let likesVC : FollowerViewController = FollowerViewController(nibName:"FollowerViewController", bundle:nil)
        likesVC.strWillAppear="likes"
        self.navigationController?.pushViewController(likesVC, animated: true)
        
    }
    
    func buttonMoreClicked(_ sender: UIButton!)
    {
        openAlertPopup()
    }
    
    
    func openAlertPopup(){
        let alertController = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        let buttonookmark = UIAlertAction(title: "Save to Bookmark", style: .default, handler: { (action) -> Void in
            print("camera button tapped")
            //     self.openCameraButton(sender: action)
        })
        let  buttonFollow = UIAlertAction(title: "Delete Post", style: .default, handler: { (action) -> Void in
            print("gallery button tapped")
            //  self.openPhotoLibraryButton(sender: action)
        })
        let buttonShare = UIAlertAction(title: "Share", style: .default, handler: { (action) -> Void in
            print("choose bg button tapped")
            //    self.chooseBackgroundButton(sender: action)
        })
               let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        alertController.addAction(buttonookmark)
        alertController.addAction(buttonFollow)
        alertController.addAction(buttonShare)
        alertController.addAction(cancelButton)
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }



}
