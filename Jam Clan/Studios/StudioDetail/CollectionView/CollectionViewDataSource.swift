//
//  CollectionViewDataSource.swift
//  ContentAwareCollectionCell
//
//  Created by  Eithan Shavit on 4/17/15.
//  Copyright (c) 2015  Eithan Shavit. All rights reserved.
//

import UIKit

protocol ContentAwareCollectionViewDataSource {
  func configuredCellForIndexPath(_ indexPath: IndexPath, prototype: Bool) -> UICollectionViewCell
}

class CollectionViewDataSource: NSObject {
  
  var data = [AnyObject]()
  var prototypeCells = NSCache<AnyObject, AnyObject>()
  var collectionView: UICollectionView!
  
  init(collectionView: UICollectionView) {
    self.collectionView = collectionView
    
    // Some dummy data
    
    let poems = [
      "Movies Dubbing",
      "Voiceover Recording","Track",
    ]
    func getRandomColor() -> UIColor {
      let colors = [UIColor(red: 233.0/255, green: 233.0/255, blue: 233.0/255, alpha: 1.0)]
      return colors[Int(arc4random_uniform(UInt32(colors.count)))]
    }

    for poem in poems {
      data.append(Poem(text: poem, moodColor: getRandomColor()))
    }
  }
  
}

// MARK: - UICollectionViewDataSource

extension CollectionViewDataSource: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = configuredCellForIndexPath(indexPath, prototype: false)
    cell.setNeedsLayout()
    return cell
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
}

// MARK: - Cell configuration

extension CollectionViewDataSource: ContentAwareCollectionViewDataSource {
  
  func configuredCellForIndexPath(_ indexPath: IndexPath, prototype: Bool) -> UICollectionViewCell {
    let cell = reusableCellForIndexPath(indexPath, prototype: prototype) as! CollectionViewCell
    let model: AnyObject = data[indexPath.row]
    cell.configure(model, prototype: prototype)
    return cell
  }
  
  fileprivate func cellIdentifierForIndexPath(_ indexPath: IndexPath) -> String {
    let model: AnyObject = data[indexPath.row]
    
    // Return reuseIdentifier based on model
    switch model {
    case let model as Poem:
      return CollectionViewCell.Const.ReuseIdentifier
    default:
      abort()
    }
  }
  
  fileprivate func reusableCellForIndexPath(_ indexPath: IndexPath, prototype: Bool) -> UICollectionViewCell {
    // Get reuse identifier
    let cellId = cellIdentifierForIndexPath(indexPath)
    
    // Return protoype if needed
    if prototype {
      return prototypeCellForIdentifier(cellId)
    }
    
    // Return dequeued cell
    return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) 
  }
  
  fileprivate func prototypeCellForIdentifier(_ reuseIdentifier: String) -> UICollectionViewCell {
    // Try to fetch prototype from cache
    if let cell = prototypeCells.object(forKey: reuseIdentifier as AnyObject) as? UICollectionViewCell {
      return cell
    }
    
    // Create new cell for reuseIdentifier
    var cell: UICollectionViewCell
    switch reuseIdentifier {
    case CollectionViewCell.Const.ReuseIdentifier:
      cell = CollectionViewCell()
    default:
      abort()
    }
    
    // Cache it
    prototypeCells.setObject(cell, forKey: reuseIdentifier as AnyObject)
    
    return cell
  }
  
  
}
