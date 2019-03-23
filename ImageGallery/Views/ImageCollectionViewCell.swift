//
//  ImageCollectionViewCell.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/15/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

  var imageURL: URL?  {
    didSet{
      updateCellImage()
    }
  }
  
  private func updateCellImage() {
    if backgroundView == nil {
      if let url = imageURL {
        DispatchQueue.global(qos: .userInitiated).sync {
          let image = url.fetchImage(url: url.imageURL)
          DispatchQueue.main.async { [weak self] in
            self?.backgroundView = UIImageView(image: image)
          }
        }
      }
    }
  }
  
  // initWithFrame to init view from code
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
 
  // initWithCode to init view from xib or storyboard
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
 
  private func setupView() {
  }
}

extension UICollectionViewCell {
  func getCellHeight(image: UIImage) -> CGFloat {
    let imageRatio =  image.size.height / image.size.width
    let cellHeight = imageRatio * bounds.width
    return cellHeight
  }
}
