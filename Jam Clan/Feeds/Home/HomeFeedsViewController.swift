//
//  HomeFeedsViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 29/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit


class HomeFeedsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var buttonMenu:UIButton!
    @IBOutlet var buttonSearch:UIButton!
    @IBOutlet var buttonFilter:UIButton!
    
    @IBOutlet var imageLineStudio:UIImageView!
    
    @IBOutlet var buttonStudios:UIButton!
    @IBOutlet var buttonFeeds:UIButton!
    @IBOutlet var buttonEvents:UIButton!
    @IBOutlet var buttonMusicCity:UIButton!
    @IBOutlet var buttonMusicPlayer:UIButton!
    
    @IBOutlet var buttonPost:UIButton!
    @IBOutlet var buttonNotification:UIButton!
    @IBOutlet var buttonPlus:UIButton!
    @IBOutlet var buttonBookmark:UIButton!
    @IBOutlet var buttonProfile:UIButton!
    
    @IBOutlet var buttonAll:UIButton!
    @IBOutlet var buttonStatus:UIButton!
    @IBOutlet var buttonPhotos:UIButton!


    
       
    @IBOutlet var scrollTop:UIScrollView!
    
    @IBOutlet var viewNav:UIView!
    @IBOutlet var viewTop:UIView!
    @IBOutlet var viewPopUp:UIView!
    @IBOutlet var viewFilter:UIView!

    @IBOutlet weak var tableFeed:UITableView!
    
    
   
    let floraButton = PDFloraButton(withPosition: .bottomRight, size: 70.0, numberOfPetals: 4, images:["commma.png","instagram.png","post-img-icon.png","video-icon.png"])

  




    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        scrollTop.contentSize=CGSize(width: 90*5, height: 0)

        floraButton.setImage(UIImage(named: "addfeed.png"), for: UIControlState())

        self.view.addSubview(floraButton)
        
        
        floraButton.buttonActionDidSelected = { (indexSelected) in
            debugPrint("Selected Index: \(indexSelected)")
        }


        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews(){
        self.setup()
    }

    func setup()
    {
        buttonAll.layer.cornerRadius=buttonAll.frame.size.height/2
        buttonStatus.layer.cornerRadius=buttonStatus.frame.size.height/2
        buttonPhotos.layer.cornerRadius=buttonPhotos.frame.size.height/2

    }
    
    func registerNib()
    {
        let nibName = UINib(nibName: "HomeFeedTableViewCell", bundle:nil)
        tableFeed.register(nibName, forCellReuseIdentifier: "Cell")
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func buttonMenuClicked()
    {
        appDelegate.showMenu()
    }
    
    @IBAction func buttonEventsClicked()
    {
        let eventsVC : EventHomeViewController = EventHomeViewController(nibName:"EventHomeViewController", bundle:nil)
        self.navigationController?.pushViewController(eventsVC, animated: false)
        
    }
    
    @IBAction func buttonMusicPlayerClicked()
    {
        let musicPlayerHomeVC : MusicPlayerHomeViewController = MusicPlayerHomeViewController(nibName:"MusicPlayerHomeViewController", bundle:nil)
        self.navigationController?.pushViewController(musicPlayerHomeVC, animated: false)
        
    }
    
    @IBAction func buttonMusicTripsClicked()
    {
        let musicTripsHomeVC : HomeMusicCityViewController = HomeMusicCityViewController(nibName:"HomeMusicCityViewController", bundle:nil)
        self.navigationController?.pushViewController(musicTripsHomeVC, animated: false)
        
    }
    
    @IBAction func buttonStudiosClicked()
    {
        let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
        self.navigationController?.pushViewController(StudiosHomeVC, animated: false)
        
    }
    
    
    @IBAction func buttonPostClicked()
    {
        
    }

    @IBAction func buttonNotificationClicked()
    {
        let feedNotiVC : FeedNotificationsViewController = FeedNotificationsViewController(nibName:"FeedNotificationsViewController", bundle:nil)
        self.navigationController?.pushViewController(feedNotiVC, animated: false)

    }

    
    @IBAction func buttonBookmarkClicked()
    {
        let feedBookmarkVC : FeedBookmarkViewController = FeedBookmarkViewController(nibName:"FeedBookmarkViewController", bundle:nil)
        self.navigationController?.pushViewController(feedBookmarkVC, animated: false)

    }

    @IBAction func buttonProfileClicked()
    {
        let feedProfileVC : FeedProfileViewController = FeedProfileViewController(nibName:"FeedProfileViewController", bundle:nil)
        self.navigationController?.pushViewController(feedProfileVC, animated: false)

    }

    
    
    
    @IBAction func buttonFilterClicked()
    {
        
        UIView.animate(withDuration: 0.3, animations:
            {
                self.viewPopUp.isHidden=false
                
                self.viewFilter.frame=CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:self.viewFilter.frame.size.height)
        }, completion: {
            (value: Bool) in
        })
        
        
    }
    
    @IBAction func buttonFilterCancelClicked()
    {
        
        
        UIView.animate(withDuration: 0.3, animations:
            {
                self.viewFilter.frame=CGRect(x:0, y:-600, width:UIScreen.main.bounds.width, height:self.viewFilter.frame.size.height)
        }, completion: {
            (value: Bool) in
            self.viewPopUp.isHidden=true
        })
        
        
    }
    
    
    @IBAction func buttonSearchClicked()
    {
        
    }
    
    
    // Collection View Method:
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return  3
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeFeedCollectionViewCell
        
        cell.buttonLikeCounts.tag = indexPath.row
        cell.buttonLikeCounts.addTarget(self, action: #selector(self.buttonLikesCountClicked(_:)), for: .touchDown)
        
        
        
        return cell

        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeFeedTableViewCell
        cell.imageProfile.layer.cornerRadius=cell.imageProfile.frame.size.height/2
        cell.imageProfile.layer.borderWidth=2.0
        cell.imageProfile.layer.borderColor=UIColor.white.cgColor

        
        
        cell.collectionFeed.delegate=self
        cell.collectionFeed.dataSource=self
        
        cell.buttonMore.tag = indexPath.row
        cell.buttonMore.addTarget(self, action: #selector(self.buttonMoreClicked(_:)), for: .touchDown)

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
        let buttonookmark = UIAlertAction(title: "Add to Bookmark", style: .default, handler: { (action) -> Void in
            print("camera button tapped")
       //     self.openCameraButton(sender: action)
        })
        let  buttonFollow = UIAlertAction(title: "Follow", style: .default, handler: { (action) -> Void in
            print("gallery button tapped")
          //  self.openPhotoLibraryButton(sender: action)
        })
        let buttonShare = UIAlertAction(title: "Share this Feed", style: .default, handler: { (action) -> Void in
            print("choose bg button tapped")
        //    self.chooseBackgroundButton(sender: action)
        })
        let buttonReport = UIAlertAction(title: "Report Abuse", style: .default, handler: { (action) -> Void in
            print("choose bg button tapped")
            //    self.chooseBackgroundButton(sender: action)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        alertController.addAction(buttonookmark)
        alertController.addAction(buttonFollow)
        alertController.addAction(buttonReport)
        alertController.addAction(buttonShare)
        alertController.addAction(cancelButton)
        self.navigationController!.present(alertController, animated: true, completion: nil)
    }

    
    
}




