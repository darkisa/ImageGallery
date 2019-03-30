//
//  ImageGallery.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/23/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class ImageGalleryView: UICollectionView {

  var totalWidth: CGFloat = 0
  
  //initWithCode to init view from xib or storyboard
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setCellSize()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setCellSize()
  }
  
  func setCellSize() {
    let containerWidth = bounds.width
    if containerWidth == totalWidth { return }
    totalWidth = containerWidth
    let columns = CGFloat(3)
    if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
      let sideMargins = layout.sectionInset.left + layout.sectionInset.right
      let cellSpacing = layout.minimumInteritemSpacing * 2
      let cellWidth = (containerWidth - (sideMargins + cellSpacing * (columns - 1))) / 3
      layout.itemSize.width = cellWidth
    }
  }
}
