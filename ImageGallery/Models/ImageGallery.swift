//
//  File.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/23/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import Foundation

struct GallerySections {
  var name: String
  var galleries: [ImageGallery]
  
  init(name: String) {
    self.name = name
    galleries = [ImageGallery]()
  }
}

struct ImageGallery {
  var name: String = "Undefined"
  var images = [Image]()
}

struct Image {
  var url: URL? = nil
  var aspectRatio: Double? = nil
  
  func propertiesAreSet() -> Bool {
    return url != nil && aspectRatio != nil
  }
}
