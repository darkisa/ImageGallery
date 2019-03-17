//
//  ShowImageViewController.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/16/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {

  var imageBuffer = UIImageView()
  
  @IBOutlet weak var imageDetail: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageDetail.addSubview(imageBuffer)
  }
  

}
