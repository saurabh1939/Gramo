//
//  MediaViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 02/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MediaViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionMedia:UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "MediaCollectionViewCell", bundle:nil)
        collectionMedia.register(nibName, forCellWithReuseIdentifier:"cell")
        // Do any additional setup after loading the view.
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
        return CGSize(width: UIScreen.main.bounds.width/3-15, height:UIScreen.main.bounds.width/3-15)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MediaCollectionViewCell
        
               
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
//        let eventDetailVC : EventDetailViewController = EventDetailViewController(nibName:"EventDetailViewController", bundle:nil)
//        self.navigationController?.pushViewController(eventDetailVC, animated: true)
        
        
    }


}
