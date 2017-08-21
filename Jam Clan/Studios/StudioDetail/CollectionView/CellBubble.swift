//
//  CellBubble.swift
//  ContentAwareCollectionCell
//
//  Created by  Eithan Shavit on 4/17/15.
//  Copyright (c) 2015  Eithan Shavit. All rights reserved.
//

import UIKit

class CellBubble: UIView {
  
  var color: UIColor!
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    let rectanglePath = UIBezierPath(roundedRect: rect, cornerRadius: 12)
    color.setFill()
    rectanglePath.fill()
  }

}
