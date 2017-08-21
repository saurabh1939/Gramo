//
//  MusicTripsDetailViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 09/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit


    class MusicTripsDetailViewController: UIViewController,FloatRatingViewDelegate,FloatyDelegate {
        
         var floaty = Floaty()
        
        @IBOutlet var scrollMain:UIScrollView!
        
        @IBOutlet var viewTop:UIView!
        @IBOutlet var viewBottom:UIView!
        @IBOutlet var viewWhen:UIView!
        @IBOutlet var viewDescription:UIView!
        @IBOutlet var viewMedia:UIView!
        @IBOutlet var viewReview:UIView!
        
        
        @IBOutlet var tableReview:UITableView!
        @IBOutlet var tableTripDetail:UITableView!

        
        
        @IBOutlet var buttonBookEvent:UIButton!
        @IBOutlet var buttonAmount:UIButton!
        
        
        @IBOutlet var viewAddReview:UIView!
        @IBOutlet var buttonViewAllReviews:UIButton!
        
        @IBOutlet var viewPopUp:UIView!
        @IBOutlet var viewBook:UIView!
        
        @IBOutlet var floatRatingView: FloatRatingView!
        
        @IBOutlet var labelHiText:UILabel!
        
        
        
        
        
        
        
        
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            self.registerNib()
            self.setUp()
            
            self.layoutFAB()
        }
        
        
        
        
        func layoutFAB() {
        //    let item = FloatyItem()
             floaty.buttonImage = UIImage(named: "event-add")
          //  item.buttonColor = UIColor.blue
     //       item.circleShadowColor = UIColor.red
        //    item.titleShadowColor = UIColor.blue
        //    item.title = "Custom item"
        //    item.handler = { item in
                
        //    }
            
         //   floaty.addItem(title: "I got a title")
       //     floaty.addItem("I got a icon", icon: UIImage(named: "icShare"))
            floaty.addItem("Request", icon: UIImage(named: "requesticon")) { item in
//                let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
                let requestVC : RequestViewController = RequestViewController(nibName:"RequestViewController", bundle:nil)
                self.navigationController?.pushViewController(requestVC, animated: true)

            }
            
            floaty.addItem("Feedback", icon: UIImage(named: "feedbackcricon")) { item in
                
                let feedbackVC : FeedbackViewController = FeedbackViewController(nibName:"FeedbackViewController", bundle:nil)
                self.navigationController?.pushViewController(feedbackVC, animated: true)
//                let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
            }

            
            
        //    floaty.addItem(item: item)
            floaty.fabDelegate = self
            
           self.view.addSubview(floaty)
            
        }
        
        func floatyOpened(_ floaty: Floaty) {
            print("Floaty Opened")
        }
        
        func floatyClosed(_ floaty: Floaty) {
            print("Floaty Closed")
        }

        
        
        
        
        // MARK: FloatRatingViewDelegate
        
        func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating:Float) {
            // self.liveLabel.text = NSString(format: "%.2f", self.floatRatingView.rating) as String
        }
        
        func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Float) {
            //  self.updatedLabel.text = NSString(format: "%.2f", self.floatRatingView.rating) as String
        }
        
        
        
        //MARK: USER DEFINED METHODS
        func registerNib()
        {
            let nibName = UINib(nibName: "ReviewTableViewCell", bundle:nil)
            tableReview.register(nibName, forCellReuseIdentifier: "Cell")
            
            
            let nibNameTrpDetail = UINib(nibName: "TripDetailTableViewCell", bundle:nil)
            tableTripDetail.register(nibNameTrpDetail, forCellReuseIdentifier: "Cell")

            
        }
        
        
        func setUp()
        {
            scrollMain.frame=CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20)
            viewTop.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 260)
            viewWhen.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 175)
            viewDescription.frame=CGRect(x: 0, y: viewWhen.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: 120)
            
             tableTripDetail.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 250*3)
            viewMedia.frame=CGRect(x: 0, y: viewDescription.frame.origin.y+viewDescription.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: tableTripDetail.frame.size.height)
            
            
            viewAddReview.frame=CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width-20, height: 80)
            tableReview.frame=CGRect(x: 0, y: viewAddReview.frame.origin.y+viewAddReview.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: 100*2)
            buttonViewAllReviews.frame=CGRect(x: 0, y: tableReview.frame.origin.y+tableReview.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: 40)
            
            viewReview.frame=CGRect(x: 0, y: viewMedia.frame.origin.y+viewMedia.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: buttonViewAllReviews.frame.origin.y+buttonViewAllReviews.frame.size.height+5)
            
            
            viewBottom.frame=CGRect(x: 10, y: viewTop.frame.size.height+20, width: UIScreen.main.bounds.width-20, height: viewReview.frame.origin.y+viewReview.frame.size.height+5)
            
            scrollMain.contentSize=CGSize(width: UIScreen.main.bounds.width, height: viewBottom.frame.origin.y+viewBottom.frame.size.height+15)
            
            viewBottom.layer.cornerRadius=10.0
            
            buttonBookEvent.layer.cornerRadius=5
            buttonAmount.layer.cornerRadius=5
            buttonAmount.layer.borderWidth=1
           // buttonAmount.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor
            buttonAmount.layer.borderColor=UIColor.lightGray.cgColor
            viewBook.layer.cornerRadius=5
            
            
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
            
            labelHiText.text=("HI! \n I WANT TO BOOK")
            
            
            
            
        }
        
        func HideViewPopUp()
        {
            viewBook.isHidden=true
          //  viewPlusOpen.isHidden=true
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func buttonBackgroundClicked()
        {
            self.HideViewPopUp()
            viewPopUp.isHidden=true
        }
        
        
        @IBAction func buttonBackClicked()
        {
            self.navigationController?.popViewController(animated: true)
        }
        
        @IBAction func buttonBookClicked()
        {
            self.HideViewPopUp()
            viewPopUp.isHidden=false
            viewBook.isHidden=false;
        }
        
        @IBAction func buttonBookCancelClicked()
        {
            self.HideViewPopUp()
            viewPopUp.isHidden=true
        }
        
        @IBAction func buttonBookConfirmClicked()
        {
            let musicTripSummaryVC : MusicTripSummaryViewController = MusicTripSummaryViewController(nibName:"MusicTripSummaryViewController", bundle:nil)
            self.navigationController?.pushViewController(musicTripSummaryVC, animated: true)
            self.HideViewPopUp()
            viewPopUp.isHidden=true
            
        }
        
        @IBAction func buttonViewAllMediaClicked()
        {
            let mediaVC : MediaViewController = MediaViewController(nibName:"MediaViewController", bundle:nil)
            self.navigationController?.pushViewController(mediaVC, animated: true)
            
            
        }
        
        
        
        
        // MARK: UITableView
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if tableView==tableTripDetail
            {
                return 3
            }
            return 2
        }
        
        // cell height
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
        }
        
        func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
        {
            if tableView==tableTripDetail
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TripDetailTableViewCell
                cell.imageTopLine.isHidden=false
                cell.imageBottomLine.isHidden=false

                if indexPath.row==0
                {
                cell.imageTopLine.isHidden=true
                }
                if indexPath.row==2
                {
                    cell.imageBottomLine.isHidden=true
                }
                
                cell.selectionStyle=UITableViewCellSelectionStyle.none
                return cell

            }
            else
            {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReviewTableViewCell
            cell.selectionStyle=UITableViewCellSelectionStyle.none
            return cell
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
        {
            
        }
        
        

        
        
        
        
}
