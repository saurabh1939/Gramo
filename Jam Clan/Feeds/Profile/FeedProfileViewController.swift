//
//  FeedProfileViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 31/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class FeedProfileViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var buttonEditTop:UIButton!
    @IBOutlet var buttonEditProfile:UIButton!
    @IBOutlet var buttonFollowers:UIButton!
    @IBOutlet var buttonFollowing:UIButton!

    
    @IBOutlet var imageProfile:UIImageView!
    @IBOutlet var imageCover:UIImageView!

    
    @IBOutlet var buttonFeeds:UIButton!
    @IBOutlet var buttonEvents:UIButton!
    @IBOutlet var buttonBands:UIButton!
   
    @IBOutlet var labelName:UILabel!
    @IBOutlet var labelCity:UILabel!

    
    
    
    
    @IBOutlet var scrollMain:UIScrollView!
    
    @IBOutlet var viewTop:UIView!
    @IBOutlet var viewMenu:UIView!
    @IBOutlet var viewAbout:UIView!
    @IBOutlet var viewInstruments:UIView!
    @IBOutlet var viewMusicType:UIView!

    
    
    
    let floraButton = PDFloraButton(withPosition: .bottomRight, size: 70.0, numberOfPetals: 4, images:["commma.png","instagram.png","post-img-icon.png","video-icon.png"])
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.registerNib()
        
        floraButton.setImage(UIImage(named: "addfeed.png"), for: UIControlState())
        
        self.view.addSubview(floraButton)
        
        
        floraButton.buttonActionDidSelected = { (indexSelected) in
            debugPrint("Selected Index: \(indexSelected)")
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func setup()
    {
        
        
//        scrollMain.frame=CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20)
//        viewTop.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250)
//        viewServices.frame=CGRect(x: 0, y: viewTop.frame.origin.y+viewTop.frame.size.height+2, width: UIScreen.main.bounds.width, height: 95)
//        viewAvailability.frame=CGRect(x: 0, y: viewServices.frame.origin.y+viewServices.frame.size.height+2, width: UIScreen.main.bounds.width, height: 140)
//        viewPackages.frame=CGRect(x: 0, y: viewAvailability.frame.origin.y+viewAvailability.frame.size.height+2, width: UIScreen.main.bounds.width, height: 255)
//        viewDescription.frame=CGRect(x: 0, y: viewPackages.frame.origin.y+viewPackages.frame.size.height+2, width: UIScreen.main.bounds.width, height: 110)
//        viewMedia.frame=CGRect(x: 0, y: viewDescription.frame.origin.y+viewDescription.frame.size.height+2, width: UIScreen.main.bounds.width, height: 145)
//        viewInstruments.frame=CGRect(x: 0, y: viewMedia.frame.origin.y+viewMedia.frame.size.height+2, width: UIScreen.main.bounds.width, height: 180)
//        
//        
//        
//        viewAddReview.frame=CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 80)
//        tableReview.frame=CGRect(x: 0, y: viewAddReview.frame.origin.y+viewAddReview.frame.size.height+2, width: UIScreen.main.bounds.width, height: 100*2)
//        buttonViewAllReviews.frame=CGRect(x: 0, y: tableReview.frame.origin.y+tableReview.frame.size.height+2, width: UIScreen.main.bounds.width, height: 40)
//        viewReview.frame=CGRect(x: 0, y: viewInstruments.frame.origin.y+viewInstruments.frame.size.height+2, width: UIScreen.main.bounds.width, height: buttonViewAllReviews.frame.origin.y+buttonViewAllReviews.frame.size.height+5)
//        
//        viewContact.frame=CGRect(x: 0, y: viewReview.frame.origin.y+viewReview.frame.size.height+2, width: UIScreen.main.bounds.width, height: 190)
//        viewSlide.frame=CGRect(x: 0, y: viewContact.frame.origin.y+viewContact.frame.size.height+2, width: UIScreen.main.bounds.width, height: 60)
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        scrollMain.contentSize=CGSize(width: UIScreen.main.bounds.width, height: viewSlide.frame.origin.y+viewSlide.frame.size.height)
//        
//        // Required float rating view params
//        self.floatRatingView.emptyImage = UIImage(named: "feed-gray-star")
//        self.floatRatingView.fullImage = UIImage(named: "feed-star")
//        // Optional params
//        self.floatRatingView.delegate = self
//        self.floatRatingView.contentMode = UIViewContentMode.scaleAspectFit
//        self.floatRatingView.maxRating = 5
//        self.floatRatingView.minRating = 1
//        self.floatRatingView.rating = 4
//        self.floatRatingView.editable = false
//        self.floatRatingView.halfRatings = true
//        self.floatRatingView.floatRatings = false
        
        
        buttonEditProfile.layer.cornerRadius=buttonEditProfile.frame.size.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews(){
        self.setup()
    }
    
    
    @IBAction func buttonEditClicked()
    {
        let editProfileVC : EditFeedProfileViewController = EditFeedProfileViewController(nibName:"EditFeedProfileViewController", bundle:nil)
        self.navigationController?.pushViewController(editProfileVC, animated: true)
        
    }
    
    @IBAction func buttonFollowersClicked()
    {
        let followerVC : FollowerViewController = FollowerViewController(nibName:"FollowerViewController", bundle:nil)
        followerVC.strWillAppear="follower"
        self.navigationController?.pushViewController(followerVC, animated: true)
        
    }

    
    @IBAction func buttonFollowingClicked()
    {
        let followerVC : FollowerViewController = FollowerViewController(nibName:"FollowerViewController", bundle:nil)
        followerVC.strWillAppear="following"
        self.navigationController?.pushViewController(followerVC, animated: true)
        
    }
    
    @IBAction func buttonFeedsClicked()
    {
        let myFeedsVC : MyFeedsViewController = MyFeedsViewController(nibName:"MyFeedsViewController", bundle:nil)
        self.navigationController?.pushViewController(myFeedsVC, animated: true)
        
    }

    
    @IBAction func buttonBandClicked()
    {
        let myBandVC : MyBandsViewController = MyBandsViewController(nibName:"MyBandsViewController", bundle:nil)
        self.navigationController?.pushViewController(myBandVC, animated: true)
        
    }

    
    @IBAction func buttonEventsClicked()
    {
        let myEventsVC : MyEventsViewController = MyEventsViewController(nibName:"MyEventsViewController", bundle:nil)
        self.navigationController?.pushViewController(myEventsVC, animated: true)
        
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
    
    @IBAction func buttonPostClicked()
    {
        let feedHomeVC : HomeFeedsViewController = HomeFeedsViewController(nibName:"HomeFeedsViewController", bundle:nil)
        self.navigationController?.pushViewController(feedHomeVC, animated: false)
        
    }
    
   
    
    @IBAction func buttonBookmarkClicked()
    {
        let feedBookmarkVC : FeedBookmarkViewController = FeedBookmarkViewController(nibName:"FeedBookmarkViewController", bundle:nil)
        self.navigationController?.pushViewController(feedBookmarkVC, animated: false)
        
    }

}
