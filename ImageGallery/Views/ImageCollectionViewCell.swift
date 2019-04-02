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
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.backgroundView = nil
  }
  
  private func updateCellImage() {
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
