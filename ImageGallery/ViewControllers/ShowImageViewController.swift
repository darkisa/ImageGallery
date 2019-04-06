//
//  ShowImageViewController.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/16/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController, UIScrollViewDelegate {

  var imageURL = Image() {
    didSet { setImage() }
  }
  
  private var imageView = UIImageView()
  private var image: UIImage? {
    get {
      return imageView.image
    }
    set {
      imageView.image = newValue
      imageView.sizeToFit()
      scrollView.contentSize = imageView.frame.size
      scrollView.addSubview(imageView)
    }
  }
  
  @IBOutlet weak var scrollView: UIScrollView! {
    didSet {
      scrollView.minimumZoomScale = 0.1
      scrollView.maximumZoomScale = 5.0
      scrollView.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  private func setImage() {
    imageURL.url?.fetchImage { [weak self] fetchedImage in
      DispatchQueue.main.async {
        self?.image = fetchedImage
      }
    }
  }
  

}

