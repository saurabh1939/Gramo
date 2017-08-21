//
//  MusicPlayerHomeViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import MediaPlayer

//@available(iOS 9.3, *)
class MusicPlayerHomeViewController: UIViewController , UIGestureRecognizerDelegate, AVAudioPlayerDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var tableSongs:UITableView!
    @IBOutlet var tableUpNextSongs:UITableView!

    
    @IBOutlet var scrollTop:UIScrollView!
    
    @IBOutlet var labelCurrentTrackName:UILabel!
    @IBOutlet var labelCurrentTrackArtist:UILabel!
    @IBOutlet var imageCurrentTrack:UIImageView!
    @IBOutlet var buttonStatus:UIButton!
    @IBOutlet var viewCurrentTrack:UIView!
    @IBOutlet var imageFullScreenCurrentTrack:UIImageView!
    @IBOutlet var imageFullScreenMainCurrentTrack:UIImageView!
    @IBOutlet var imageFullScreenMainFirstSong:UIImageView!


    @IBOutlet var imageFullScreenProgress:UIImageView!


    @IBOutlet var viewFullScreenAudio:UIView!
    @IBOutlet var viewUpNext:UIView!
    @IBOutlet var viewUpNextFirstSong:UIView!


    @IBOutlet var buttonFirstSongStatus:UIButton!
    @IBOutlet var buttonTrack:UIButton!
    @IBOutlet var buttonFullScreenStatus:UIButton!
    @IBOutlet var buttonFullScreenNext:UIButton!
    @IBOutlet var buttonFullScreenPrevious:UIButton!
    @IBOutlet var labelFullScreenCurrentTrackName:UILabel!
    @IBOutlet var labelFullScreenCurrentTrackArtist:UILabel!
    @IBOutlet var labelFullScreenFirstSongName:UILabel!
    @IBOutlet var labelFullScreenFirstSongArtist:UILabel!
    
    var cureentTrackID = NSInteger()
    var totalSongDuration = NSInteger()

    var arrayUPNext = NSMutableArray()
    var arrayTemp = NSMutableArray()

    
    var isFullScreenList = false
    var isFullScreenListPlayClicked = false

    var tableData = MPMediaQuery()
    var isSongFound = false
    var isSongPlaying = false










    var audio: AVAudioPlayer! = nil

    
    func exampleMethod() {
        if #available(iOS 9.3, *) {
            let authorizationStatus = MPMediaLibrary.authorizationStatus()
            switch authorizationStatus {
            case .notDetermined:
                // Show the permission prompt.
                MPMediaLibrary.requestAuthorization({[weak self] (newAuthorizationStatus: MPMediaLibraryAuthorizationStatus) in
                    // Try again after the prompt is dismissed.
                    self?.exampleMethod()
                   
                    
                   
                })
            case .denied, .restricted:
                // Do not use MPMediaQuery.
                let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Music permission is not enabled. Go to iPhone Settings to enable music.", preferredStyle: .alert)
                let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in
                    //Just dismiss the action sheet
                    self.navigationController?.popViewController(animated: false)
                }
                actionSheetController.addAction(cancelAction)
                self.present(actionSheetController, animated: true, completion: nil)
                return
            default:
                // Proceed as usual.
                break
            }
        }
        // Do stuff with MPMediaQuery here...
        
        self.tableData = MPMediaQuery.playlists()
        
        if (self.tableData.items?.count)!>0
        {
            
            self.isSongFound=true
            self.tableSongs.reloadData()
            
        }

        
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.exampleMethod()
        
     //   tableData = MPMediaQuery.playlists()
        
        
     //   isSongFound=true
        
        
        self.registerNib()

//        self.tableData = MPMediaQuery.playlists()
//        
//        if (self.tableData.items?.count)!>0
//        {
//            print((self.tableData.items?.count)!)
//
//            print(self.tableData.items!)
//            self.isSongFound=true
//            self.tableSongs.reloadData()
//            
//        }

        
       
        
    }
    
    override func viewWillLayoutSubviews(){
        self.setup()
    }
    
//    override func viewWillDisappear(_ animated: Bool)
//    {
//        audio.stop()
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isSongPlaying
        {
            audio.stop()

        }
        
    }
    
    func setup()
    {
        imageFullScreenMainCurrentTrack.layer.cornerRadius=imageFullScreenMainCurrentTrack.frame.size.height/2;
        scrollTop.contentSize=CGSize(width: 90*5, height: 0)
        buttonStatus.layer.cornerRadius=buttonStatus.frame.size.height/2
        self.tableSongs.frame=CGRect(x:0, y:114, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-114)
        self.viewUpNext.frame=CGRect(x:0, y:UIScreen.main.bounds.height-100, width:UIScreen.main.bounds.width, height:100)
        self.viewUpNextFirstSong.frame=CGRect(x:15, y:0, width:UIScreen.main.bounds.width-30, height:70)

        self.tableUpNextSongs.frame=CGRect(x:15, y:70, width:UIScreen.main.bounds.width-30, height:100)

        
    let panGesture = UIPanGestureRecognizer(target: self, action:("handlePanGesture:"))
        viewUpNextFirstSong.addGestureRecognizer(panGesture)
        self.viewUpNextFirstSong.isUserInteractionEnabled = true
        
        let panGesture1 = UIPanGestureRecognizer(target: self, action:("handlePanGesture1:"))
        viewFullScreenAudio.addGestureRecognizer(panGesture1)
        self.viewFullScreenAudio.isUserInteractionEnabled = true

        
        let bottomOffset = CGPoint(x: scrollTop.contentSize.width - scrollTop.bounds.size.width, y:0 )
        scrollTop.setContentOffset(bottomOffset, animated: true)
        
    }

    
func handlePanGesture(_ panGesture: UIPanGestureRecognizer) {
    
    let translation = panGesture.translation(in: self.view)
        
        // Use translation.y to change the position of your customView, e.g.
     //   self.viewUpNext.center.y = translation.y // Customize this.
    
    
    
    if translation.y > 0 {
        // user dragged towards the down
     //   print("down")
        UIView.animate(withDuration: 0.3, animations:
            {
        self.viewUpNext.frame=CGRect(x:0, y:UIScreen.main.bounds.height-100, width:UIScreen.main.bounds.width, height:100)
        self.viewUpNextFirstSong.frame=CGRect(x:15, y:0, width:UIScreen.main.bounds.width-30, height:70)

        self.tableUpNextSongs.frame=CGRect(x:15, y:70, width:UIScreen.main.bounds.width-30, height:100)
    //    tableUpNextSongs.isScrollEnabled=false
    }, completion: {
        (value: Bool) in
    })

    
    }
    else {
        // user dragged towards the up
       // print("up")
        UIView.animate(withDuration: 0.3, animations:
            {
        self.viewUpNext.frame=CGRect(x:0, y:150, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-150)
        self.viewUpNextFirstSong.frame=CGRect(x:15, y:0, width:UIScreen.main.bounds.width-30, height:70)

        self.tableUpNextSongs.frame=CGRect(x:15, y:70, width:UIScreen.main.bounds.width-30, height:UIScreen.main.bounds.height-220)
    //    tableUpNextSongs.isScrollEnabled=true
        }, completion: {
            (value: Bool) in
        })

    }
    
    
    }
    
    
    
    func handlePanGesture1(_ panGesture: UIPanGestureRecognizer) {
        
        let translation = panGesture.translation(in: self.view)
        
        
        if translation.y > 0 {
            // user dragged towards the down
            //   print("down")
            UIView.animate(withDuration: 0.2, animations:
                {
                   self.viewFullScreenAudio.frame=CGRect(x:0, y:UIScreen.main.bounds.height, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
            }, completion: {
                (value: Bool) in
            })
            
            
        }
        
        
    }

    
    //MARK: USER DEFINED METHODS
    func registerNib()
    {
        let nibName = UINib(nibName: "MusicPlayerTableViewCell", bundle:nil)
        tableSongs.register(nibName, forCellReuseIdentifier: "Cell")
        
        let nibName1 = UINib(nibName: "UpNextMusicTableViewCell", bundle:nil)
        tableUpNextSongs.register(nibName1, forCellReuseIdentifier: "Cell")

    }
    
    func trackClicked()
    {
        
        UIView.animate(withDuration: 0.3, animations:
            {
                
                self.viewCurrentTrack.frame=CGRect(x:0, y:UIScreen.main.bounds.height-70, width:UIScreen.main.bounds.width, height:70)
                self.tableSongs.frame=CGRect(x:0, y:114, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-(114+70))
                
        }, completion: {
            (value: Bool) in
        })
        
        
        
    }
    
    
    
    
    @IBAction func buttonStudiosClicked()
    {
        let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
        self.navigationController?.pushViewController(StudiosHomeVC, animated: false)
        
    }
    
    
    
    @IBAction func buttonMusicTripsClicked()
    {
        let musicTripsHomeVC : HomeMusicCityViewController = HomeMusicCityViewController(nibName:"HomeMusicCityViewController", bundle:nil)
        self.navigationController?.pushViewController(musicTripsHomeVC, animated: false)
        
    }

    @IBAction func buttonEventsClicked()
    {
        let eventsVC : EventHomeViewController = EventHomeViewController(nibName:"EventHomeViewController", bundle:nil)
        self.navigationController?.pushViewController(eventsVC, animated: false)
        
    }
    
    @IBAction func buttonFeedsClicked()
    {
        let feedsHomeVC : HomeFeedsViewController = HomeFeedsViewController(nibName:"HomeFeedsViewController", bundle:nil)
        self.navigationController?.pushViewController(feedsHomeVC, animated: false)
        
    }


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonMenuClicked()
    {
        appDelegate.showMenu()
    }
    
    @IBAction func buttonFullScreenCancelClicked()
    {
        UIView.animate(withDuration: 0.2, animations:
            {
                
                self.viewFullScreenAudio.frame=CGRect(x:0, y:UIScreen.main.bounds.height, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
                
                
        }, completion: {
            (value: Bool) in
        })

    }
    
    
    @IBAction func buttonTrackClicked()
    {
        UIView.animate(withDuration: 0.2, animations:
            {
                self.viewFullScreenAudio.frame=CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)

                
        }, completion: {
            (value: Bool) in
        })
        
    }

    
    @IBAction func buttonFullScreenNextClicked()
    {
        if cureentTrackID<(tableData.items?.count)!
        {
            cureentTrackID=cureentTrackID+1
        //    self.changeSong()
            self.getData(index: cureentTrackID)

            
        }
    }
    
    @IBAction func buttonFullScreenPreviousClicked()
    {
        if cureentTrackID<(tableData.items?.count)! && cureentTrackID > 0
        {
            cureentTrackID=cureentTrackID-1
            self.getData(index: cureentTrackID)
            
        }
    }
    
    
    
    func Noir() {
        //Auto Adjustment to Input Image
        
        let context = CIContext(options: nil)
        
        var inputImage = CIImage(image: imageFullScreenCurrentTrack.image!)
        let options:[String : AnyObject] = [CIDetectorImageOrientation:1 as AnyObject]
        let filters = inputImage!.autoAdjustmentFilters(options: options)
        
        for filter: CIFilter in filters {
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            inputImage =  filter.outputImage
        }
        let cgImage = context.createCGImage(inputImage!, from: inputImage!.extent)
        self.imageFullScreenCurrentTrack.image =  UIImage(cgImage: cgImage!)
        
        
        //Apply noir Filter //
        let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
        currentFilter!.setValue(CIImage(image: UIImage(cgImage: cgImage!)), forKey: kCIInputImageKey)
        
        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        imageFullScreenCurrentTrack.image = processedImage
        
    }
    
    func getData(index:NSInteger)
    {
        
//        totalSongDuration=NSInteger(0.0)
//        self.CircularProgress()
        isSongPlaying=true
        
        self.trackClicked()
        let playlist: MPMediaItem
        if isFullScreenList
        {
            playlist = arrayUPNext[index] as! MPMediaItem

        }
        else
        {
            playlist = tableData.items![index]

        }
        
        labelCurrentTrackName.text=playlist.value(forProperty: MPMediaItemPropertyTitle) as? NSString as String?
        labelCurrentTrackArtist.text=playlist.value(forProperty: MPMediaItemPropertyArtist) as? NSString as String?
        labelFullScreenCurrentTrackName.text=playlist.value(forProperty: MPMediaItemPropertyTitle) as? NSString as String?
        labelFullScreenCurrentTrackArtist.text=playlist.value(forProperty: MPMediaItemPropertyArtist) as? NSString as String?
        labelFullScreenFirstSongName.text=playlist.value(forProperty: MPMediaItemPropertyTitle) as? NSString as String?
        labelFullScreenFirstSongArtist.text=playlist.value(forProperty: MPMediaItemPropertyArtist) as? NSString as String?

        imageCurrentTrack.image=nil
        imageFullScreenCurrentTrack.image=nil
        imageFullScreenMainCurrentTrack.image=nil
        imageFullScreenMainFirstSong.image=nil
        
        if let artwork: MPMediaItemArtwork = playlist.value(forProperty: MPMediaItemPropertyArtwork) as? MPMediaItemArtwork{
            imageCurrentTrack.image = artwork.image(at: CGSize(width: 50, height: 50))
            imageFullScreenCurrentTrack.image = artwork.image(at: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            imageFullScreenMainCurrentTrack.image = artwork.image(at: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            imageFullScreenMainFirstSong.image = artwork.image(at: CGSize(width: 50, height: 50))

            
            
        }
        
        if imageCurrentTrack.image==nil
        {
            imageCurrentTrack.image=UIImage(named:"musicplayimg.png")
            imageFullScreenCurrentTrack.image=UIImage(named:"musicplayimg.png")
            imageFullScreenMainCurrentTrack.image=UIImage(named:"musicplayimg.png")
            imageFullScreenMainFirstSong.image=UIImage(named:"musicplayimg.png")

            
        }
        
        buttonStatus.isSelected=false
        buttonFullScreenStatus.isSelected=false
        buttonFirstSongStatus.isSelected=false;

        
        self.Noir()
        
        
        let url: URL = playlist.value( forProperty: MPMediaItemPropertyAssetURL ) as! URL
        
        do {
            audio = try AVAudioPlayer(contentsOf: url)
            
            
            let session = AVAudioSession.sharedInstance()
            
            try session.setCategory(AVAudioSessionCategoryPlayback)
            try session.setActive(true)
            
            
            guard let player = audio
                else
            {
                return
            }
            player.prepareToPlay()
            totalSongDuration=NSInteger(player.duration)
            self.CircularProgress()

            player.delegate=self
            player.play()
        }
        catch let error as NSError
        {
            print(error.description)
        }
        
        if isFullScreenList
        {
            arrayTemp.removeAllObjects()
            arrayTemp.addObjects(from: arrayUPNext as! [Any])
            arrayUPNext.removeAllObjects()
            for i in index ..< (arrayTemp.count)
            {
                arrayUPNext.add(arrayTemp[i])
            }
        }
        else
        {
            arrayUPNext.removeAllObjects()
            for i in index ..< (tableData.items?.count)!
            {
                arrayUPNext.add(tableData.items![i])
            }
            
        }
        print(arrayUPNext.count)
        tableUpNextSongs.reloadData()

        

    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        self.buttonFullScreenNextClicked()
    }
    
    
    
    
    func CircularProgress()
    {
        let circle = imageFullScreenProgress
        
        var progressCircle = CAShapeLayer()
        
     //   let circlePath = UIBezierPath(ovalInRect: (circle!.bounds))
        
       
        let centerPoint = CGPoint (x: (circle?.bounds.width)!/2, y: (circle?.bounds.width)!/2);
        let circleRadius : CGFloat = circle!.bounds.width/2 * 0.83;
        
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise: true    );
        
      //  progressCircle = CAShapeLayer ();
        
        
      //  let circlePath = UIBezierPath(ovalInRect: CGRectInset(circle.bounds, 5 / 2.0, 5 / 2.0))
        progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.cgPath
        progressCircle.strokeColor = UIColor.orange.cgColor
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = 5.0
        
        circle?.layer.addSublayer(progressCircle)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = CFTimeInterval(totalSongDuration)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        progressCircle.add(animation, forKey: "ani")
    }
    
    
    
//    @IBAction func buttonFullScreenSongStatusClicked()
//    {
//        if buttonFullScreenStatus.isSelected
//        {
//            audio.play()
//            buttonFullScreenStatus.isSelected=false
//            buttonStatus.isSelected=false;
//            buttonFirstSongStatus.isSelected=false;
//
//
//            
//            
//        }
//        else
//        {
//            audio.pause()
//            buttonFullScreenStatus.isSelected=true
//            buttonStatus.isSelected=true;
//            buttonFirstSongStatus.isSelected=true;
//
//            
//            
//        }
//    }

    
    
    @IBAction func buttonSongStatusClicked()
    {
    if buttonStatus.isSelected
    {
        audio.play()
        buttonStatus.isSelected=false
        buttonFullScreenStatus.isSelected=false
        buttonFirstSongStatus.isSelected=false;


    }
        else
    {
        audio.pause()
        buttonStatus.isSelected=true
        buttonFullScreenStatus.isSelected=true
        buttonFirstSongStatus.isSelected=true;



    }
    }
    
    
    // MARK: UITableView
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Up next"
    }
    
    func tableView(_tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.red
        
        return vw
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat
    {
        if tableView==tableUpNextSongs
        {
            return 25
        }
        return 0
    }

    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        
        if tableView==tableUpNextSongs
        {
            if arrayUPNext.count>1
            {
                return 1
            }
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView==tableSongs
        {
            if isSongFound
            {
               return self.tableData.items!.count

            }
            
        }
        if arrayUPNext.count>1
        {
            return self.arrayUPNext.count-1
        }
       return 0

    }
      //  return 10
    
    // cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        
        
        if tableView==tableSongs
        {
            let playlist : MPMediaItem
            print(indexPath.row)
            
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MusicPlayerTableViewCell
            playlist = (tableData.items?[indexPath.row])!
             let playlistName = playlist.value(forProperty: MPMediaItemPropertyTitle) as? NSString
            
                cell.labelSongName.text = playlistName as String?;
                let playlistName1 = playlist.value(forProperty: MPMediaItemPropertyArtist) as? NSString
               cell.labelSongArtist.text = playlistName1 as String?;
                cell.imageSong.image=nil
                if let artwork: MPMediaItemArtwork = playlist.value(forProperty: MPMediaItemPropertyArtwork) as? MPMediaItemArtwork{
                    cell.imageSong.image = artwork.image(at: CGSize(width: 50, height: 50))
                }
                if cell.imageSong.image==nil
                {
                    cell.imageSong.image=UIImage(named:"musicplayimg.png")
                }

            
            cell.selectionStyle=UITableViewCellSelectionStyle.none
            return cell
            
        }
        else
        {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UpNextMusicTableViewCell
            let playlist : MPMediaItem
            
//                if indexPath.section==0
//                {
//                    playlist = arrayUPNext[0] as! MPMediaItem
//                    
//                }
//                else
//                {
                    playlist = arrayUPNext[indexPath.row+1] as! MPMediaItem
                    
              //  }

           
            let playlistName = playlist.value(forProperty: MPMediaItemPropertyTitle) as? NSString
            cell1.labelSongName.text = playlistName as String?;
            
            let playlistName1 = playlist.value(forProperty: MPMediaItemPropertyArtist) as? NSString
            cell1.labelSongArtist.text = playlistName1 as String?;
            
            cell1.imageSong.image=nil
            if let artwork: MPMediaItemArtwork = playlist.value(forProperty: MPMediaItemPropertyArtwork) as? MPMediaItemArtwork{
                cell1.imageSong.image = artwork.image(at: CGSize(width: 50, height: 50))
            }
            if cell1.imageSong.image==nil
            {
                cell1.imageSong.image=UIImage(named:"musicplayimg.png")
            }
            cell1.selectionStyle=UITableViewCellSelectionStyle.none
            return cell1
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        if tableView==tableSongs
        {
            isFullScreenList=false
            cureentTrackID=indexPath.row
            self.getData(index: indexPath.row)

        }
        else
        {
            isFullScreenList=true
//            if indexPath.section==0
//            {
//                if isFullScreenListPlayClicked
//                {
//                    isFullScreenListPlayClicked=false
//                    audio.play()
//                    buttonFullScreenStatus.isSelected=false
//                    buttonStatus.isSelected=false;
//
//
//                }
//                else
//                {
//                    isFullScreenListPlayClicked=true
//                    audio.pause()
//                    buttonFullScreenStatus.isSelected=true
//                    buttonStatus.isSelected=true;
//
//
//                }
//
//            }
//            else
//            {
                cureentTrackID=indexPath.row+1
                self.getData(index: indexPath.row+1)

        //    }
        }
        
      
    }
    
    
    
}

