//
//  MyEventsViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 03/06/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MyEventsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var collectionUpcoming:UICollectionView!
    @IBOutlet var scrollMain:UIScrollView!



    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollMain.frame=CGRect(x: 0, y: 114, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-114)

        let nibName = UINib(nibName: "EventHomeCollectionViewCell", bundle:nil)
        collectionUpcoming.register(nibName, forCellWithReuseIdentifier:"cell")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonBackClicked()
    {
        self.navigationController?.popViewController(animated: true)
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
