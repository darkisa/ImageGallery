//
//  ImageCollectionViewCell.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/15/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

  var imageURL: URL? = nil  {
    didSet{
      updateCellImage()
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.backgroundView = nil
  }
  
  private func updateCellImage() {
    if imageURL != nil {
      imageURL!.fetchImage { [weak self](data) in
        DispatchQueue.main.async {
          self?.backgroundView = UIImageView(image: data)
        }
      }
    }
  }
}
