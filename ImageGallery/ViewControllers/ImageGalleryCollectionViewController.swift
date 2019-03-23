//
//  ImageGalleryCollectionViewController.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/11/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ImageGalleryCollectionViewController: UICollectionViewController, UIDropInteractionDelegate, UICollectionViewDelegateFlowLayout {
  
  var gallery = ImageGallery()
  var images = [Image]()

  var imageFetcher: ImageFetcher!
  @IBOutlet weak var imageGallery: UICollectionView! {
    didSet {
      imageGallery.addInteraction(UIDropInteraction(delegate: self))
    }
  }
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
    return session.canLoadObjects(ofClass: UIImage.self) && session.canLoadObjects(ofClass: NSURL.self)
  }
  
  func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
    return UIDropProposal(operation: .copy)
  }
  
  func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
    var cellImage = Image()
    session.loadObjects(ofClass: NSURL.self) { urls in
      if let url = urls.first as? URL {
        cellImage.url = url
        print(cellImage)
      }
    }
    session.loadObjects(ofClass: UIImage.self) { images in
      if let image = images.first as? UIImage {
        cellImage.aspectRatio = Double(image.size.height / image.size.width)
        print(cellImage)
      }
    }
    images.append(cellImage)
    collectionView.reloadData()
  }
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if let destination = segue.destination as? ShowImageViewController {
//      if let collectionItem = sender as? Int {
//          destination.imageBuffer = UIImageView(image: images[collectionItem])
//      }
//    }
//  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "ShowImageDetail", sender: indexPath.row)
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()

      // Uncomment the following line to preserve selection between presentations
      // self.clearsSelectionOnViewWillAppear = false

      // Register cell classes
      self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

      // Do any additional setup after loading the view.
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using [segue destinationViewController].
      // Pass the selected object to the new view controller.
  }
  */

  // MARK: UICollectionViewDataSource

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
  }


  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of items
      return images.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
    print(images)
    if let url = images[indexPath.row].url {
      (cell as? ImageCollectionViewCell)?.imageURL = url
    }
    return cell
  }

  // MARK: UICollectionViewDelegate

  /*
  // Uncomment this method to specify if the specified item should be highlighted during tracking
  override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
      return true
  }
  */

  /*
  // Uncomment this method to specify if the specified item should be selected
  override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
      return true
  }
  */

  /*
  // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
  override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
      return false
  }

  override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
      return false
  }

  override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
  
  }
  */
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
    if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout  {
      layout.itemSize.height = 2
    }

    return CGSize(width: 200, height: 300)
  }

}

extension URL {
  func fetchImage(url: URL) -> UIImage? {
    var image: UIImage? = nil
    let urlContents = try? Data(contentsOf: url)
    if let imageData = urlContents {
      image = UIImage(data: imageData)
    }
    return image
  }
}
