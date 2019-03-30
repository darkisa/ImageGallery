//
//  File.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/23/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import Foundation

struct ImageGallery {
  var name: String? = nil
  var images = [Image]()
}

struct Image {
  var url: URL? = nil {
    didSet {
      if propertiesAreSet() { handler(self) }
    }
  }
  var aspectRatio: Double? = nil {
    didSet {
      if propertiesAreSet() { handler(self) }
    }
  }
  
  init(handler: @escaping (Image) -> Void) {
    self.handler = handler
  }
  
  var handler: (Image) -> Void
  
  private func propertiesAreSet() -> Bool {
    let bool = (url != nil && aspectRatio != nil) ? true : false
    return bool
  }
}