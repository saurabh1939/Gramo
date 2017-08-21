//
//  MerchandiseViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 05/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MerchandiseViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet var collectionMerchandise:UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "ProductCollectionViewCell", bundle:nil)
        collectionMerchandise.register(nibName, forCellWithReuseIdentifier:"cell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonMenuClicked()
    {
        appDelegate.showMenu()
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
        return CGSize(width: UIScreen.main.bounds.width/2-15, height:UIScreen.main.bounds.width/2+60)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCollectionViewCell
        
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let merchandiseDetailVC : MerchandiseDetailViewController = MerchandiseDetailViewController(nibName:"MerchandiseDetailViewController", bundle:nil)
        self.navigationController?.pushViewController(merchandiseDetailVC, animated: true)
        
        
    }


}
