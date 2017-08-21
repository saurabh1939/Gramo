//
//  FavouritesViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 24/07/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var collectionEvent : UICollectionView!
    @IBOutlet var collectionMusiccity : UICollectionView!
    @IBOutlet var collectionStudios : UICollectionView!
    
    @IBOutlet var viewTop:UIView!
    @IBOutlet var viewNav:UIView!
    
    
    @IBOutlet var buttonEvents : UIButton!
    @IBOutlet var buttonMusiccity : UIButton!
    @IBOutlet var buttonStudios : UIButton!
    
    @IBOutlet var imageButtonselection : UIImageView!
    @IBOutlet var scrollTables : UIScrollView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
        setup()

        // Do any additional setup after loading the view.
    }
    
    func registerNib()
    {
        let nibName = UINib(nibName: "EventHomeCollectionViewCell", bundle:nil)
        collectionEvent.register(nibName, forCellWithReuseIdentifier:"cell")
        
        let nibName1 = UINib(nibName: "EventHomeCollectionViewCell", bundle:nil)
        collectionMusiccity.register(nibName1, forCellWithReuseIdentifier:"cell")
        
        let nibName2 = UINib(nibName: "EventHomeCollectionViewCell", bundle:nil)
        collectionStudios.register(nibName2, forCellWithReuseIdentifier:"cell")

    }

    
    func setup()
    {
        scrollTables.frame=CGRect(x: 0, y: 114, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-114)
        
        scrollTables.contentSize = CGSize(width: UIScreen.main.bounds.width*3, height: 0)
        viewNav.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        viewTop.frame=CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 50)
        buttonEvents.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/3, height: 50)
        buttonMusiccity.frame=CGRect(x: buttonEvents.frame.origin.x+buttonEvents.frame.size.width, y: 0, width: UIScreen.main.bounds.width/3, height: 50)
        buttonStudios.frame=CGRect(x: buttonMusiccity.frame.origin.x+buttonMusiccity.frame.size.width, y: 0, width: UIScreen.main.bounds.width/3, height: 50)
        imageButtonselection.frame = CGRect(x: 0, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        
        collectionEvent.frame = CGRect(x: 0, y: 0 , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (self.viewTop.frame.height + self.viewNav.frame.height)
        )
        collectionMusiccity.frame = CGRect(x: UIScreen.main.bounds.width, y: 0  , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (self.viewTop.frame.height + self.viewNav.frame.height)
        )
        collectionStudios.frame = CGRect(x: UIScreen.main.bounds.width*2, y: 0 , width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - (self.viewTop.frame.height + self.viewNav.frame.height)
        )
        
               
    }
    
    @IBAction func buttonMenuClicked()
    {
        appDelegate.showMenu()
    }
    
    @IBAction func buttonEventclicked()
    {
        scrollTables.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        imageButtonselection.frame = CGRect(x: 0, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        
    }
    @IBAction func buttonMusiccityclicked()
    {
        scrollTables.setContentOffset(CGPoint(x: UIScreen.main.bounds.width, y: 0), animated: true)
        imageButtonselection.frame = CGRect(x: buttonEvents.frame.origin.x+buttonEvents.frame.size.width, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        
    }
    @IBAction func buttonStudiosclicked()
    {
        scrollTables.setContentOffset(CGPoint(x: UIScreen.main.bounds.width*2, y: 0), animated: true)
        imageButtonselection.frame = CGRect(x: buttonMusiccity.frame.origin.x+buttonMusiccity.frame.size.width, y: 48, width: UIScreen.main.bounds.width/3, height: 2)
        
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // your code here
        return CGSize(width: UIScreen.main.bounds.width/2-15, height:UIScreen.main.bounds.width/2-15)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? EventHomeCollectionViewCell
        
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let eventDetailVC : EventDetailViewController = EventDetailViewController(nibName:"EventDetailViewController", bundle:nil)
        self.navigationController?.pushViewController(eventDetailVC, animated: true)
        
        
    }


}
