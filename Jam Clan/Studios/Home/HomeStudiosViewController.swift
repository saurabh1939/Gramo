//
//  HomeStudiosViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 27/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class HomeStudiosViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
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
    
    @IBOutlet var buttonEast:UIButton!
    @IBOutlet var buttonNorth:UIButton!
    @IBOutlet var buttonSouth:UIButton!
    @IBOutlet var buttonWest:UIButton!

    
    @IBOutlet var scrollTop:UIScrollView!
    
    @IBOutlet var viewNav:UIView!
    @IBOutlet var viewTop:UIView!
    @IBOutlet var viewPopUp:UIView!

    @IBOutlet var viewFilter:UIView!
    
    @IBOutlet var tableStudios:UITableView!
    @IBOutlet var collectionSortBy:UICollectionView!






    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerNib()

        self.setUp()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "HomeStudiosTableViewCell", bundle:nil)
        tableStudios.register(nibName, forCellReuseIdentifier: "Cell")
        
        let nibNameCollection=UINib(nibName:"SortByCollectionViewCell", bundle:nil)
        collectionSortBy.register(nibNameCollection, forCellWithReuseIdentifier:"cell")

    }

    func setUp()
    {
        scrollTop.contentSize=CGSize(width: 90*5, height: 0)
 //       buttonRatingHighToLow.layer.borderWidth=1.0
//        buttonRatingLowToHigh.layer.borderWidth=1.0
//        buttonRatingLowToHigh.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor
//        buttonRatingHighToLow.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor
        
        buttonEast.layer.borderWidth=1.0
        buttonEast.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor
        buttonNorth.layer.borderWidth=1.0
        buttonNorth.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor
        buttonSouth.layer.borderWidth=1.0
        buttonSouth.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor
        buttonWest.layer.borderWidth=1.0
        buttonWest.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor



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
//        let musicPlayerHomeVC : MusicPlayerHomeViewController = MusicPlayerHomeViewController(nibName:"MusicPlayerHomeViewController", bundle:nil)
//        self.navigationController?.pushViewController(musicPlayerHomeVC, animated: false)
        
    }
    
    @IBAction func buttonMusicTripsClicked()
    {
        let musicTripsHomeVC : HomeMusicCityViewController = HomeMusicCityViewController(nibName:"HomeMusicCityViewController", bundle:nil)
        self.navigationController?.pushViewController(musicTripsHomeVC, animated: false)
        
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
    
//    @IBAction func buttonHighToLowClicked(sender: AnyObject?)
//    {
//        buttonRatingHighToLow.backgroundColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0)
//        buttonRatingHighToLow.setTitleColor(UIColor.white, for: .normal)
//
//        
//        buttonRatingLowToHigh.backgroundColor=UIColor.clear
//        buttonRatingLowToHigh.setTitleColor(UIColor.darkGray, for: .normal)
//    }
//    
//    @IBAction func buttonLowToHighClicked(sender: AnyObject?)
//    {
//        buttonRatingLowToHigh.backgroundColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0)
//        buttonRatingLowToHigh.setTitleColor(UIColor.white, for: .normal)
//        
//        buttonRatingHighToLow.backgroundColor=UIColor.clear
//        buttonRatingHighToLow.setTitleColor(UIColor.darkGray, for: .normal)
//
//
//
//    }
    
    
    @IBAction func buttonFilterServicesClicked()
    {
        let servicesVC : ServicesViewController = ServicesViewController(nibName:"ServicesViewController", bundle:nil)
        self.navigationController?.pushViewController(servicesVC, animated: true)

    }
    
    
    @IBAction func buttonFilterInstrumentsClicked()
    {
        let instrumentsVC : InstrumentsViewController = InstrumentsViewController(nibName:"InstrumentsViewController", bundle:nil)
        self.navigationController?.pushViewController(instrumentsVC, animated: true)

    }
    
    @IBAction func buttonFilterLocationClicked()
    {
        let locationVC : LocationViewController = LocationViewController(nibName:"LocationViewController", bundle:nil)
        self.navigationController?.pushViewController(locationVC, animated: true)
        
    }

    
    @IBAction func buttonFilterApplyClicked()
    {
        
        
        UIView.animate(withDuration: 0.3, animations:
            {
                self.viewFilter.frame=CGRect(x:0, y:-600, width:UIScreen.main.bounds.width, height:self.viewFilter.frame.size.height)
        }, completion: {
            (value: Bool) in
            self.viewPopUp.isHidden=true
        })
        
        
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
        let cell = tableStudios.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeStudiosTableViewCell
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
     {
        let studioDetail : StudioDetailViewController = StudioDetailViewController(nibName:"StudioDetailViewController", bundle:nil)
        self.navigationController?.pushViewController(studioDetail, animated: true)

    }

    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
        
        
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width/3-15, height:UIScreen.main.bounds.width/3-15)
//        
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SortByCollectionViewCell
        cell?.layer.borderWidth=1.0
        cell?.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor

        
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        //        let eventDetailVC : EventDetailViewController = EventDetailViewController(nibName:"EventDetailViewController", bundle:nil)
        //        self.navigationController?.pushViewController(eventDetailVC, animated: true)
        
        
    }
    
    
}
