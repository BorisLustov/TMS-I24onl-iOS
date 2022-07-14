//
//  ViewControllerGallery.swift
//  HomeWork_11
//
//  Created by Борис Лустов on 12.07.22.
//

import UIKit

class ViewControllerGallery: UIViewController {
    
    // MARK: - UIImageViews
    
    let imageView = UIImageView()
    
    // MARK: - Constants
    
    let picArray = ["pic1","pic2","pic3","pic4"]
    
    // MARK: - Variables
    
    var currentPic = 0
    var imageArray = [UIImage]()
    
    // MARK: - View Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Gallery"

        view.backgroundColor = .white
        
        imageView.frame = view.bounds
        imageView.backgroundColor = view.backgroundColor
        imageView.image = UIImage(named: picArray[currentPic])
        imageView.contentMode = .center
        
        picArray.forEach {
            let image = UIImage(named: $0)
            imageArray.append(image!)
        }
        
//        imageView.animationImages = imageArray
//        imageView.animationDuration = 2
//        imageView.animationRepeatCount = 2
//        imageView.startAnimating()
        
        view.addSubview(imageView)
        
        gesture()
    }
    
    // MARK: - Functions
    
    /// Setting swipes by pictures
    func gesture() {
        
        let swipeLeft = UISwipeGestureRecognizer()
        let swipeRight = UISwipeGestureRecognizer()
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        imageView.isUserInteractionEnabled = true
        
        imageView.addGestureRecognizer(swipeLeft)
        imageView.addGestureRecognizer(swipeRight)
        
        swipeLeft.addTarget(self, action: #selector(nextPic))
        swipeRight.addTarget(self, action: #selector(previousPic))
    }
    
    /// Swipe left, next picture
    @objc func nextPic() {
        
        if currentPic == picArray.count - 1 {
            currentPic = 0
        } else {
            currentPic += 1
        }
        
        imageView.image = UIImage(named: picArray[currentPic])
    }
    
    /// Swipe to the right previous picture
    @objc func previousPic() {
        
        if currentPic == 0 {
            currentPic = picArray.count - 1
        } else {
            currentPic -= 1
        }
        
        imageView.image = UIImage(named: picArray[currentPic])
    }

}
