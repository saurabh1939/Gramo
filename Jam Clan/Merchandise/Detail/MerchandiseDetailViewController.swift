//
//  MerchandiseDetailViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 05/05/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class MerchandiseDetailViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionProduct:UICollectionView!
    @IBOutlet var collectionSizes:UICollectionView!

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "ProductDetailCollectionViewCell", bundle:nil)
        collectionProduct.register(nibName, forCellWithReuseIdentifier:"cell")
        
        let nibName1 = UINib(nibName: "SizesCollectionViewCell", bundle:nil)
        collectionSizes.register(nibName1, forCellWithReuseIdentifier:"cell")

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
        
        if collectionView==collectionSizes {
            return 4
        }
        return 10
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // your code here
        if collectionView==collectionSizes
        {
        return CGSize(width: 60, height:50)
        }
        return CGSize(width: UIScreen.main.bounds.width-50, height:UIScreen.main.bounds.width)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView==collectionSizes
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SizesCollectionViewCell
            cell?.contentView.layer.borderWidth=1
            
            return cell!
        }
        else
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductDetailCollectionViewCell
        
        
        return cell!
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        
        
        
    }


}
