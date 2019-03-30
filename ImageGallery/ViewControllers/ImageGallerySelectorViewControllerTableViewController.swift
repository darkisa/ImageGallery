//
//  ImageGallerySelectorViewControllerTableViewController.swift
//  ImageGallery
//
//  Created by Darko Mijatovic on 3/15/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class ImageGallerySelectorViewControllerTableViewController: UITableViewController {
  
  
  var imageGalleries = ["Recently Deleted": [String](), "Gallery": [String]()]
  override func viewDidLoad() {
      super.viewDidLoad()

      // Uncomment the following line to preserve selection between presentations
      // self.clearsSelectionOnViewWillAppear = false

      // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  
  @IBAction func newImageGallery(_ sender: UIBarButtonItem) {
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    if splitViewController?.preferredDisplayMode != .primaryOverlay {
      splitViewController?.preferredDisplayMode = .primaryOverlay
    }
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return imageGalleries.count
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
    let currentSection = Array(imageGalleries.keys)[section]
    let noOfRows = imageGalleries[currentSection]?.count ?? 0
    return noOfRows
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ImageGalleryCell", for: indexPath)
      cell.textLabel?.text = "Test"
      cell.detailTextLabel?.text = "Test2"


      return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let sectionText = Array(imageGalleries.keys)[section]
    return sectionText
  }

  /*
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
  }
  */

  /*
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          // Delete the row from the data source
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }
  }
  */

  /*
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

  }
  */

  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the item to be re-orderable.
      return true
  }
  */

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

}
