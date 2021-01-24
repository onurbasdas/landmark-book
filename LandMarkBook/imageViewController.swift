//
//  imageViewController.swift
//  LandMarkBook
//
//  Created by Onur Başdaş on 24.01.2021.
//

import UIKit

class imageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    var selectedLandmarkText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        textView.text = selectedLandmarkText
        
    }
    
    
    
}
