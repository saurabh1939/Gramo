//
//  CollectionViewCell.swift
//  ContentAwareCollectionCell
//
//  Created by  Eithan Shavit on 4/17/15.
//  Copyright (c) 2015  Eithan Shavit. All rights reserved.
//

import UIKit

protocol ContentAwareCollectionViewCell {
  func configure(_ model: AnyObject, prototype: Bool)
  func fittedSizeForConstrainedSize(_ constrainedSize: CGSize) -> CGSize
}

class CollectionViewCell: UICollectionViewCell, ContentAwareCollectionViewCell {
  
  struct Const {
    static var ReuseIdentifier = "CollectionViewCell"
  }
  
  let TextLabelSidePadding: CGFloat = 8.0
  
  let textLabel = UILabel()
  let containerView = CellBubble()
  
  convenience init() {
    self.init(frame: CGRect.zero)
    setup()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  func setup()
  {
    contentView.addSubview(containerView)
    contentView.backgroundColor = UIColor.white
    containerView.backgroundColor = UIColor.white
    textLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 12)
    textLabel.textColor = UIColor.black
    textLabel.numberOfLines = 1
    textLabel.textAlignment = NSTextAlignment.center
    textLabel.lineBreakMode = .byWordWrapping
    containerView.addSubview(textLabel)
  }
  
  func configure(_ model: AnyObject, prototype: Bool) {
    let poem = model as! Poem
    textLabel.text = poem.text
    containerView.color = poem.moodColor
    containerView.setNeedsDisplay()
  }
    
  func fittedSizeForConstrainedSize(_ size: CGSize) -> CGSize {
    let textLabelConstrainedSize = CGSize(width: size.width - TextLabelSidePadding * 2.0, height: size.height - TextLabelSidePadding * 2.0)
    let textLabelSize = textLabel.sizeThatFits(textLabelConstrainedSize)
    
    // The cell itself chooses its own size based on its content and constrains from the collection view
    return CGSize(width: textLabelSize.width+30, height: textLabelSize.height + TextLabelSidePadding * 2.0)
  }
  override func layoutSubviews()
  {
    super.layoutSubviews()
    containerView.frame = contentView.bounds
    let textLabelFrame = containerView.bounds.insetBy(dx: TextLabelSidePadding, dy: TextLabelSidePadding)
    textLabel.frame = textLabelFrame
  }
  
}
