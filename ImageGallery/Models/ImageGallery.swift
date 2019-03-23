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
  var url: URL? = nil
  var aspectRatio: Double = 0.0
}
