//
//  ShowImageViewController.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/16/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController, UIScrollViewDelegate {

  var imageBuffer = UIImageView()
  
  @IBOutlet weak var imageDetail: UIScrollView! {
    didSet {
      imageDetail.minimumZoomScale = 0.1
      imageDetail.maximumZoomScale = 5.0
      imageDetail.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageDetail.addSubview(imageBuffer)
  }
  

}

