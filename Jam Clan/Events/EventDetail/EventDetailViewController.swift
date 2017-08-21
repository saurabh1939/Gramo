//
//  EventDetailViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 01/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,FloatRatingViewDelegate {

    @IBOutlet var scrollMain:UIScrollView!
    
    @IBOutlet var viewTop:UIView!
    @IBOutlet var viewBottom:UIView!
    @IBOutlet var viewWhen:UIView!
    @IBOutlet var viewDescription:UIView!
    @IBOutlet var viewMedia:UIView!
    @IBOutlet var viewReview:UIView!
    
    @IBOutlet var collectionMedia:UICollectionView!

    @IBOutlet var tableReview:UITableView!
    
    @IBOutlet var buttonPlus:UIButton!
    
    @IBOutlet var buttonBookEvent:UIButton!
    @IBOutlet var buttonAmount:UIButton!

    
    @IBOutlet var viewAddReview:UIView!
    @IBOutlet var buttonViewAllReviews:UIButton!
    
    @IBOutlet var viewPopUp:UIView!
    @IBOutlet var viewBook:UIView!
    @IBOutlet var viewPlusOpen:UIView!
    
    @IBOutlet var floatRatingView: FloatRatingView!
    
    @IBOutlet var labelHiText:UILabel!











    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.registerNib()
        self.setUp()
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
        
        let nibNameCollection = UINib(nibName: "MediaCollectionViewCell", bundle:nil)
        collectionMedia.register(nibNameCollection, forCellWithReuseIdentifier:"cell")

    }

    
    func setUp()
    {
        scrollMain.frame=CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20)
        viewTop.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 260)
        viewWhen.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 175)
        viewDescription.frame=CGRect(x: 0, y: viewWhen.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: 120)
        viewMedia.frame=CGRect(x: 0, y: viewDescription.frame.origin.y+viewDescription.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: 165)
        
        viewAddReview.frame=CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width-20, height: 80)
        tableReview.frame=CGRect(x: 0, y: viewAddReview.frame.origin.y+viewAddReview.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: 100*2)
        buttonViewAllReviews.frame=CGRect(x: 0, y: tableReview.frame.origin.y+tableReview.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: 40)
        
        viewReview.frame=CGRect(x: 0, y: viewMedia.frame.origin.y+viewMedia.frame.size.height+2, width: UIScreen.main.bounds.width-20, height: buttonViewAllReviews.frame.origin.y+buttonViewAllReviews.frame.size.height+5)


        viewBottom.frame=CGRect(x: 10, y: viewTop.frame.size.height+20, width: UIScreen.main.bounds.width-20, height: viewReview.frame.origin.y+viewReview.frame.size.height+5)

        scrollMain.contentSize=CGSize(width: UIScreen.main.bounds.width, height: viewBottom.frame.origin.y+viewBottom.frame.size.height+15)

        viewBottom.layer.cornerRadius=10.0
        buttonPlus.layer.cornerRadius=buttonPlus.layer.frame.size.height/2
        
        buttonBookEvent.layer.cornerRadius=5
        buttonAmount.layer.cornerRadius=5
        buttonAmount.layer.borderWidth=1
        buttonAmount.layer.borderColor=UIColor(red: 203/255, green: 69/255, blue: 62/255, alpha: 1.0).cgColor
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
        viewPlusOpen.isHidden=true
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
        let summaryVC : EventSummaryViewController = EventSummaryViewController(nibName:"EventSummaryViewController", bundle:nil)
        self.navigationController?.pushViewController(summaryVC, animated: true)
        self.HideViewPopUp()
        viewPopUp.isHidden=true
        
    }
    
    @IBAction func buttonViewAllMediaClicked()
    {
        let mediaVC : MediaViewController = MediaViewController(nibName:"MediaViewController", bundle:nil)
        self.navigationController?.pushViewController(mediaVC, animated: true)

        
    }
    @IBAction func buttonPlusClicked()
    {
        self.HideViewPopUp()
        viewPopUp.isHidden=false
        viewPlusOpen.isHidden=false
    }

    
    @IBAction func buttonFeedbackclicked()
    {
        let feedbackVC : FeedbackViewController = FeedbackViewController(nibName:"FeedbackViewController", bundle:nil)
        self.navigationController?.pushViewController(feedbackVC, animated: true)
        self.HideViewPopUp()
        viewPopUp.isHidden=true
    }
    

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
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
                
    }
    
    
    //MARK: UICollectionView

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // your code here
        return CGSize(width: 75, height:75)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MediaCollectionViewCell
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
     //   let mediaVC : MediaViewController = MediaViewController(nibName:"MediaViewController", bundle:nil)
      //  self.navigationController?.pushViewController(mediaVC, animated: true)
        
        
    }

    
    

}
