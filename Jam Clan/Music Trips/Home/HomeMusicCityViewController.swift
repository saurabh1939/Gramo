//
//  HomeMusicCityViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 09/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire



    class HomeMusicCityViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
        
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
        
               
        
        @IBOutlet var scrollTop:UIScrollView!
        
        @IBOutlet var viewNav:UIView!
        @IBOutlet var viewTop:UIView!
        @IBOutlet var viewPopUp:UIView!
        
        @IBOutlet var viewFilter:UIView!
        
        var currentPage:Int = 0
        var totalPages:Int = 0
        var isNoData:Bool = false
        
        var arrayItems : NSMutableArray!

        
        
        @IBOutlet var collectionMusicTrips:UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.arrayItems = []

            // Do any additional setup after loading the view.
            scrollTop.contentSize=CGSize(width: 90*5, height: 0)
            let nibName = UINib(nibName: "MusicTripHomeCollectionViewCell", bundle:nil)
            collectionMusicTrips.register(nibName, forCellWithReuseIdentifier:"cell")
            currentPage=1
            ApiGetMusicTrips()
            
            
        }
        
        @IBAction func buttonMenuClicked()
        {
            appDelegate.showMenu()
        }
        
        @IBAction func buttonFeedsClicked()
        {
            let feedsHomeVC : HomeFeedsViewController = HomeFeedsViewController(nibName:"HomeFeedsViewController", bundle:nil)
            self.navigationController?.pushViewController(feedsHomeVC, animated: false)
            
        }

        
        
        @IBAction func buttonStudiosClicked()
        {
            let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
            self.navigationController?.pushViewController(StudiosHomeVC, animated: false)
            
        }
        
        @IBAction func buttonMusicPlayerClicked()
        {
            let musicPlayerHomeVC : MusicPlayerHomeViewController = MusicPlayerHomeViewController(nibName:"MusicPlayerHomeViewController", bundle:nil)
            self.navigationController?.pushViewController(musicPlayerHomeVC, animated: false)
            
        }

        
        @IBAction func buttonEventClicked()
        {
            let eventsVC : EventHomeViewController = EventHomeViewController(nibName:"EventHomeViewController", bundle:nil)
            self.navigationController?.pushViewController(eventsVC, animated: false)

            
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
        
        
        
        @IBAction func buttonFilterServicesClicked()
        {
            let servicesVC : ServicesViewController = ServicesViewController(nibName:"ServicesViewController", bundle:nil)
            self.navigationController?.pushViewController(servicesVC, animated: true)
            
        }
        
        
        @IBAction func buttonFilterCategoryClicked()
        {
            let servicesVC : ServicesViewController = ServicesViewController(nibName:"ServicesViewController", bundle:nil)
            self.navigationController?.pushViewController(servicesVC, animated: true)
            
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
        
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            
            return 1
            
        }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            if self.arrayItems.count>0
            {
                return self.arrayItems.count
                
            }
            return 0

            
            
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            // your code here
            return CGSize(width: UIScreen.main.bounds.width/2-15, height:UIScreen.main.bounds.width/2-15)
            
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicTripHomeCollectionViewCell
            
            cell.labelName.text=""
            cell.labelBy.text=""
            cell.labelPrice.text=""
            cell.labelRating.text=""
            cell.imageItem.image=nil
            
            
            cell.labelName.text=((self.arrayItems[indexPath.row] as? NSDictionary )?.value(forKey: "info") as? NSDictionary)?.value(forKey: "name") as? String
            
            cell.labelBy.text="by \(String(describing: (((self.arrayItems[indexPath.row] as? NSDictionary )?.value(forKey: "info") as? NSDictionary)?.value(forKey: "user") as? NSDictionary)?.value(forKey: "name") as! String))"
            
            
            
            if (((self.arrayItems[indexPath.row] as! NSDictionary).value(forKey: "info") as? NSDictionary)?.value(forKey: "coverPhoto") as! NSArray).count>0
            {
                
                cell.imageItem.sd_setImage(with: URL(string: ((((self.arrayItems[indexPath.row] as? NSDictionary )?.value(forKey: "info") as? NSDictionary)?.value(forKey: "coverPhoto") as? NSArray)?.object(at: 0) as! NSDictionary).value(forKey: "url") as! String), placeholderImage: UIImage(named: "placeholder.png"))
                
            }
            
            cell.labelRating.text = "\(String(describing: ((self.arrayItems[indexPath.row] as! NSDictionary ).value(forKey: "info") as! NSDictionary).value(forKey: "rating") as! Double))"
            
            cell.labelPrice.text = "\(String(describing: ((self.arrayItems[indexPath.row] as! NSDictionary ).value(forKey: "info") as! NSDictionary).value(forKey: "perHourCost") as! Double))/hr"
            

            
            
            return cell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
            
            let tripDetailVC : MusicTripsDetailViewController = MusicTripsDetailViewController(nibName:"MusicTripsDetailViewController", bundle:nil)
            self.navigationController?.pushViewController(tripDetailVC, animated: true)
            
            
        }
        
        func ApiGetMusicTrips()
        {
            self.appDelegate.showHud(title: "Loading Events...", sender: self.view)
            let urlString = "/api/pageListing"
            
            
            // pageType:event/studios/musictrip/band
            //   page_no:1
            //   userId:595e12c2fe387f21beada133
            
            let requestParam:Parameters = [
                "pageType":"musictrip",
                "page_no":currentPage,
                "deviceType":kConstant.Constants.via,
                "userId":"5982f692f1da7d1e12b18485",
                "deviceToken":UserDefaults.standard.value(forKey: "deviceToken") as Any,
                "userType":"user",
                "authToken":UserDefaults.standard.value(forKey: "authToken") as Any,
                "lat":UserDefaults.standard.value(forKey: "lat") as Any,
                "long":UserDefaults.standard.value(forKey: "long") as Any
                
                
            ]
            let headers: HTTPHeaders = HttpApiModel().header()
            print("\(requestParam)")
            Alamofire.request(kConstant.Constants.kBaseURL.appending(urlString), method: .post, parameters: requestParam, encoding:URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                case .success(_):
                    if response.response?.statusCode==200
                    {
                        
                        let dict = response.result.value as! NSDictionary
                        
                        var theJSONText:String! = ""
                        
                        do {
                            let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                            // here "jsonData" is the dictionary encoded in JSON data
                            
                            theJSONText = NSString(data: jsonData!,
                                                   encoding: String.Encoding.ascii.rawValue) as String!
                        }
                        
                        print(theJSONText)
                        
                        
                        let arrayTemp = (dict.object(forKey: "response") as! NSDictionary).value(forKey: "list") as! NSArray
                        //  self.totalPages = (dict.object(forKey: "response") as! NSDictionary).value(forKey: "list") as! Int
                        self.isNoData=false
                        if arrayTemp.count > 0
                        {
                            self.arrayItems.addObjects(from: arrayTemp as! [Any])
                            
                            self.collectionMusicTrips.reloadData()
                        }
                        else
                        {
                            self.isNoData=true
                        }
                        
                        
                        //    let result = dict.object(forKey: "response") as! NSDictionary
                        
                        
                        self.appDelegate.hideHud()
                        
                        
                        
                        
                    }
                    else
                    {
                        self.appDelegate.showAlert(Title: response.result.value as? String ?? "errorMsg")
                        self.appDelegate.hideHud()
                        
                    }
                    break
                case .failure(_):
                    print(response.result.error ?? "Response")
                    self.appDelegate.hideHud()
                    
                    
                    break
                    
                }
                
            }
        }
        
        
}
