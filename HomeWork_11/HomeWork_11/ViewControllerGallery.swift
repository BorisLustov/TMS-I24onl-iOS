//
//  ViewControllerGallery.swift
//  HomeWork_11
//
//  Created by Борис Лустов on 12.07.22.
//

import UIKit

class ViewControllerGallery: UIViewController {
    
    // MARK: - UIImageView
    
    private let imageView = UIImageView()
    
    // MARK: - Struct objects
    
    private let const = Constants()
    private var variable = Variables()
    
    // MARK: - View Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Gallery"
        view.backgroundColor = .white
        
        setupImageView()
        setupGestureImageView()
    }
    
    // MARK: - Functions
    
    private func setupImageView() {
        
        imageView.frame = view.bounds
        imageView.backgroundColor = view.backgroundColor
        imageView.image = UIImage(named: const.picArray[variable.currentPic])
        imageView.contentMode = .center
        
        view.addSubview(imageView)
    }
    
    private func setupGestureImageView() {
        
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
    @objc private func nextPic() {
        
        if variable.currentPic == const.picArray.count - 1 {
            variable.currentPic = 0
        } else {
            variable.currentPic += 1
        }
        
        imageView.image = UIImage(named: const.picArray[variable.currentPic])
    }
    
    /// Swipe right, previous picture
    @objc private func previousPic() {
        
        if variable.currentPic == 0 {
            variable.currentPic = const.picArray.count - 1
        } else {
            variable.currentPic -= 1
        }
        
        imageView.image = UIImage(named: const.picArray[variable.currentPic])
    }
}

extension ViewControllerGallery {
        
    private struct Constants {
        
        let picArray = ["pic1","pic2","pic3","pic4"]
    }
        
    private struct Variables {
        
        var currentPic = 0
    }
}
