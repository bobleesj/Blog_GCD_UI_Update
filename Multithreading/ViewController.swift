//
//  ViewController.swift
//  Multithreading
//
//  Created by Bob Lee on 12/9/16.
//  Copyright © 2016 BobtheDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var girlImage: UIImageView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  override func viewDidLoad() {
    super.viewDidLoad()
    activityIndicator.stopAnimating()
  }

  
    @IBAction func nextImageClicked(_ sender: UIButton) {
    let number = Int(arc4random_uniform(9))
    chooseImage(girlNumber: number)
  }

  
  func chooseImage(girlNumber: Int) {
    activityIndicator.startAnimating()
    var imageURL = URL(string: "")
    switch girlNumber {
    case 0: imageURL = URL(string: "https://goo.gl/8q08OP")
    case 1: imageURL = URL(string: "https://goo.gl/cc23OE")
    case 2: imageURL = URL(string: "https://goo.gl/ZP6Bvh")
    case 3: imageURL = URL(string: "https://goo.gl/Vn9oqX")
    case 4: imageURL = URL(string: "https://goo.gl/GUxkqU")
    case 5: imageURL = URL(string: "https://goo.gl/jCLhhD")
    case 6: imageURL = URL(string: "https://goo.gl/UETU1G")
    case 7: imageURL = URL(string: "https://goo.gl/4v5RfE")
    case 8: imageURL = URL(string: "https://goo.gl/zJri4Z")
    case 9: imageURL = URL(string: "https://goo.gl/uQwgoy")
    default:
      break
    }
    fetchImageFromURL(imageURL: imageURL!)
  }
  
  func fetchImageFromURL(imageURL: URL) {
    DispatchQueue.global(qos: DispatchQoS.userInitiated.qosClass).async {
      let fetch = NSData(contentsOf: imageURL as URL)
      // Display about the actual image
      DispatchQueue.main.async {
        if let imageData = fetch {
          self.activityIndicator.stopAnimating()
          self.girlImage.image = UIImage(data: imageData as Data)
        }
      }
    }
  }
}

