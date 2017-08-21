//
//  StudioDetailViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 29/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import Alamofire


class StudioDetailViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,FloatRatingViewDelegate {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var scrollMain:UIScrollView!
    
    @IBOutlet var viewTop:UIView!
    @IBOutlet var viewServices:UIView!
    @IBOutlet var viewAvailability:UIView!
    @IBOutlet var viewPackages:UIView!
    @IBOutlet var viewDescription:UIView!
    @IBOutlet var viewMedia:UIView!
    @IBOutlet var viewInstruments:UIView!
    @IBOutlet var viewReview:UIView!
    @IBOutlet var viewContact:UIView!
    @IBOutlet var viewSlide:UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionSuggested: UICollectionView!
    @IBOutlet weak var collectionCheckAvl: UICollectionView!
    @IBOutlet weak var collectionMedia: UICollectionView!
    @IBOutlet weak var collectionInstruments: UICollectionView!
    @IBOutlet weak var tableReview:UITableView!
    
    @IBOutlet var viewAddReview:UIView!
    @IBOutlet var buttonViewAllReviews:UIButton!
    
    var arrayCheckTime: NSMutableArray!
    var arraySuggested: NSMutableArray!
    var arraySuggestedPrice: NSMutableArray!
    @IBOutlet var textviewDescription: UITextView!
    @IBOutlet var floatRatingView: FloatRatingView!
    
    @IBOutlet var viewPopUp:UIView!
    @IBOutlet var viewPlusOpen:UIView!
    @IBOutlet var viewPrice:UIView!

    var arrayItems : NSMutableArray!
    
    var dictData : NSMutableDictionary!
    
    var strStudioId:NSString!


   
    
    fileprivate var collectionViewDataSource: CollectionViewDataSource!
    fileprivate var cellSizeCache = NSCache<AnyObject, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure collection view
        
        self.arrayItems = []
        self.dictData=[:]

        collectionViewDataSource = CollectionViewDataSource(collectionView: collectionView)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.Const.ReuseIdentifier)
        collectionView.dataSource = collectionViewDataSource

        // Do any additional setup after loading the view.
        
         arraySuggested = ["None", "3 days", "5 days", "10 days", "15 days", "20 days"]
        arraySuggestedPrice = ["$0", "$3,400", "$5,000", "$6,500", "$10,000", "$11,000"]
        arrayCheckTime = ["10-11AM", "11-12AM", "1-12PM", "2-3PM", "4-5PM", "5-6PM"]
        self.registerNib()
        ApiGetStudioDetail()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: FloatRatingViewDelegate
    
    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating:Float) {
        // self.liveLabel.text = NSString(format: "%.2f", self.floatRatingView.rating) as String
    }
    
    func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Float) {
        //  self.updatedLabel.text = NSString(format: "%.2f", self.floatRatingView.rating) as String
    }

    
    
    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func buttonBackgroundClicked()
    {
        viewPopUp.isHidden=true
        viewPrice.isHidden=true
        viewPlusOpen.isHidden=true
        
    }
    
    @IBAction func buttonBottomClicked()
    {
        viewPopUp.isHidden=false
        viewPrice.isHidden=false
    }
    
    @IBAction func buttonSlideClicked()
    {
     //   viewPopUp.isHidden=false
      //  viewBookingConfirmed.isHidden=false
        
    }
    
    @IBAction func buttonPlusClicked()
    {
        viewPrice.isHidden=true
        viewPopUp.isHidden=false
        viewPlusOpen.isHidden=false
    }

    @IBAction func buttonFeedbackclicked()
    {
        let feedbackVC : FeedbackViewController = FeedbackViewController(nibName:"FeedbackViewController", bundle:nil)
        self.navigationController?.pushViewController(feedbackVC, animated: true)
      //  self.HideViewPopUp()
        viewPopUp.isHidden=true
    }
    
    @IBAction func buttonRateclicked()
    {
    let rateVC : RateViewController = RateViewController(nibName:"RateViewController", bundle:nil)
    self.navigationController?.pushViewController(rateVC, animated: true)
        viewPopUp.isHidden=true

    }
    

    override func viewWillLayoutSubviews(){
        self.setup()
    }
    
    func registerNib()
    {
        let nibNameCollection=UINib(nibName:"SuggestedCollectionViewCell", bundle:nil)
        collectionSuggested.register(nibNameCollection, forCellWithReuseIdentifier:"cell")
       
        let nibNameCollectionCheck=UINib(nibName:"CheckAvlCollectionViewCell", bundle:nil)
        collectionCheckAvl.register(nibNameCollectionCheck, forCellWithReuseIdentifier:"cell")
        
        let nibNameCollectionMedia=UINib(nibName:"MediaCollectionViewCell", bundle:nil)
        collectionMedia.register(nibNameCollectionMedia, forCellWithReuseIdentifier:"cell")
        // InstrumentsCollectionViewCell
        
        let nibNameCollectionInstruments=UINib(nibName:"InstrumentsCollectionViewCell", bundle:nil)
        collectionInstruments.register(nibNameCollectionInstruments, forCellWithReuseIdentifier:"cell")
        
        let nibName = UINib(nibName: "ReviewTableViewCell", bundle:nil)
        tableReview.register(nibName, forCellReuseIdentifier: "Cell")
    }
    
    func setup()
    {
        
        
        scrollMain.frame=CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20)
        viewTop.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 250)
        viewServices.frame=CGRect(x: 0, y: viewTop.frame.origin.y+viewTop.frame.size.height+2, width: UIScreen.main.bounds.width, height: 95)
        viewAvailability.frame=CGRect(x: 0, y: viewServices.frame.origin.y+viewServices.frame.size.height+2, width: UIScreen.main.bounds.width, height: 140)
        viewPackages.frame=CGRect(x: 0, y: viewAvailability.frame.origin.y+viewAvailability.frame.size.height+2, width: UIScreen.main.bounds.width, height: 255)
        viewDescription.frame=CGRect(x: 0, y: viewPackages.frame.origin.y+viewPackages.frame.size.height+2, width: UIScreen.main.bounds.width, height: 110)
        viewMedia.frame=CGRect(x: 0, y: viewDescription.frame.origin.y+viewDescription.frame.size.height+2, width: UIScreen.main.bounds.width, height: 145)
        viewInstruments.frame=CGRect(x: 0, y: viewMedia.frame.origin.y+viewMedia.frame.size.height+2, width: UIScreen.main.bounds.width, height: 180)
        
        
        
        viewAddReview.frame=CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 80)
        tableReview.frame=CGRect(x: 0, y: viewAddReview.frame.origin.y+viewAddReview.frame.size.height+2, width: UIScreen.main.bounds.width, height: 100*2)
        buttonViewAllReviews.frame=CGRect(x: 0, y: tableReview.frame.origin.y+tableReview.frame.size.height+2, width: UIScreen.main.bounds.width, height: 40)
        viewReview.frame=CGRect(x: 0, y: viewInstruments.frame.origin.y+viewInstruments.frame.size.height+2, width: UIScreen.main.bounds.width, height: buttonViewAllReviews.frame.origin.y+buttonViewAllReviews.frame.size.height+5)
        
        viewContact.frame=CGRect(x: 0, y: viewReview.frame.origin.y+viewReview.frame.size.height+2, width: UIScreen.main.bounds.width, height: 190)
        viewSlide.frame=CGRect(x: 0, y: viewContact.frame.origin.y+viewContact.frame.size.height+2, width: UIScreen.main.bounds.width, height: 60)







        
        
        
        
        
        
        
        scrollMain.contentSize=CGSize(width: UIScreen.main.bounds.width, height: viewSlide.frame.origin.y+viewSlide.frame.size.height)
        
        // Required float rating view params
        self.floatRatingView.emptyImage = UIImage(named: "feed-gray-star")
        self.floatRatingView.fullImage = UIImage(named: "feed-star")
        // Optional params
        self.floatRatingView.delegate = self
        self.floatRatingView.contentMode = UIViewContentMode.scaleAspectFit
        self.floatRatingView.maxRating = 5
        self.floatRatingView.minRating = 1
        self.floatRatingView.rating = 4
        self.floatRatingView.editable = false
        self.floatRatingView.halfRatings = true
        self.floatRatingView.floatRatings = false
    }
    // Collection View Method:
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionSuggested)
        {
            return  arraySuggested.count
        }
        else if (collectionView == collectionMedia)
        {
            return  8
        }
        else if (collectionView == collectionInstruments)
        {
            return  4
        }
        return arrayCheckTime.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == collectionSuggested)
        {
            return CGSize(width: UIScreen.main.bounds.width/2-15, height:UIScreen.main.bounds.width/6-15)
        }
        else if (collectionView == collectionCheckAvl)
        {
            return CGSize(width: UIScreen.main.bounds.width/4-15, height:UIScreen.main.bounds.width/7-15)
        }
        else if (collectionView == collectionInstruments)
        {
            return CGSize(width: UIScreen.main.bounds.width/2-15, height:UIScreen.main.bounds.width/5-15)
        }
        else if (collectionView == collectionMedia)
        {
           return CGSize(width: UIScreen.main.bounds.width/4-10, height:UIScreen.main.bounds.width/4-15)
        }
        else
        {
            // If fitted size was computed in the past for this cell, return it from cache
            if let size = cellSizeCache.object(forKey: indexPath as AnyObject) as? NSValue {
                return size.cgSizeValue
            }
            
            // Get a configured prototype cell
            let cell = collectionViewDataSource.configuredCellForIndexPath(indexPath, prototype: true) as! ContentAwareCollectionViewCell
            
            // Set a constrained size for the cell
            // *In this case we choose to constrain based on the width
            let width: CGFloat = collectionView.bounds.width/1.5 - 10  //CGFloat.greatestFiniteMagnitude
            
            let height = CGFloat.greatestFiniteMagnitude
            let constrainedSize = CGSize(width: width, height: height)
            
            // Finally get what we wanted, the fitted size for this cell
            let size = cell.fittedSizeForConstrainedSize(constrainedSize)
            
            // Cache it
            cellSizeCache.setObject(NSValue(cgSize: size), forKey: indexPath as AnyObject)
            
            return size
        }
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionSuggested)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SuggestedCollectionViewCell
            
            cell?.labelName.text = (arraySuggested.object(at: indexPath.row) as AnyObject) as? String
            cell?.labelPrice.text = (arraySuggestedPrice.object(at: indexPath.row) as AnyObject) as? String
            if(indexPath.row == 0)
            {
                cell?.buttoninfo.isHidden = true
            }
             return cell!
        }
        else if (collectionView == collectionMedia)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MediaCollectionViewCell
            
            //cell?.labelName.text = (arraySuggested.object(at: indexPath.row) as AnyObject) as? String
            return cell!
        }
        else if (collectionView == collectionInstruments)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InstrumentsCollectionViewCell
            
            //cell?.labelName.text = (arraySuggested.object(at: indexPath.row) as AnyObject) as? String
            return cell!
        }
        else
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CheckAvlCollectionViewCell
            
            
            cell?.labelTime.layer.cornerRadius = 10;
            cell?.labelTime.layer.masksToBounds = true;
            cell?.labelTime.layer.borderColor = UIColor(red: 118.0/255, green: 92.0/255, blue: 214.0/255, alpha: 1.0).cgColor
            cell?.labelTime.layer.borderWidth = 0.5;
            cell?.labelTime.text = (arrayCheckTime.object(at: indexPath.row) as AnyObject) as? String
             return cell!
            
        }

    }
    
    // Table View Method :
    // MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReviewTableViewCell
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }
    
    
    func ApiGetStudioDetail()
    {
        self.appDelegate.showHud(title: "Loading Studios...", sender: self.view)
        let urlString = "/api/pages/"
        
        
        // pageType:event/studios/musictrip/band
        //   page_no:1
        //   userId:595e12c2fe387f21beada133
        
        let requestParam:Parameters = [
            "pageId":self.strStudioId,
            "deviceType":kConstant.Constants.via,
            "userId":"5982f692f1da7d1e12b18485",
            "deviceToken":UserDefaults.standard.value(forKey: "deviceToken") as Any,
            "authToken":UserDefaults.standard.value(forKey: "authToken")!,
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
                    
                    
             //       self.dictData = (dict.object(forKey: "response") as! NSMutableDictionary)
                    //  self.totalPages = (dict.object(forKey: "response") as! NSDictionary).value(forKey: "list") as! Int
                    
                    
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
