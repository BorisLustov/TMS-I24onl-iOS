//
//  ViewControllerGallery.swift
//  HomeWork_11
//
//  Created by Борис Лустов on 12.07.22.
//

import UIKit

final class ViewControllerGallery: UIViewController {
    
    // MARK: - UIImageView
    
    private let imageView = UIImageView()
    
    // MARK: - Struct objects
    
    private let const = Constants()
    private var variable = Variables()
    
    // MARK: - View Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearanceView()
        
        embedViews()
        setupLayout()
        setupAppearanceImageView()
        setupGestureSwipe()
    }
    
    // MARK: - Selectors
    
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

// MARK: - Embed views

private extension ViewControllerGallery {
    
    func embedViews() {
        view.addSubview(imageView)
    }
}

// MARK: - Setup layout

private extension ViewControllerGallery {
    
    func setupLayout() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
                
        let height = NSLayoutConstraint(
            item: imageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: view,
            attribute: .height,
            multiplier: 0.7,
            constant: 0
        )
        
        let width = NSLayoutConstraint(
            item: imageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.7,
            constant: 0
        )
        
        height.isActive = true
        width.isActive = true
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Setup appearance

private extension ViewControllerGallery {
    
    func setupAppearanceView() {
        title = "Gallery"
        view.backgroundColor = .white
    }
    
    func setupAppearanceImageView() {
        imageView.backgroundColor = view.backgroundColor
        imageView.image = UIImage(named: const.picArray[variable.currentPic])
        imageView.contentMode = .scaleToFill
        imageView.addShadow(.black)
    }
}

// MARK: - Setup gesture

private extension ViewControllerGallery {
    
    func setupGestureSwipe() {
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
}

// MARK: - Constants & Variables

private extension ViewControllerGallery {
    
    struct Constants {
        let picArray = ["pic1","pic2","pic3","pic4"]
    }
    
    struct Variables {
        var currentPic = 0
    }
}

// MARK: - Shadow for UIView

extension UIView {
    
    /// shadowOpacity = 0.7
    /// shadowRadius = 10
    func addShadow(_ color: UIColor) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 10
    }
}
