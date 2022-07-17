//
//  ViewControllerRandomCircles.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerRandomCircles: UIViewController {
    
    // MARK: - UIView
    
    private var arrayOfCircles = [UIView]()
    
    // MARK: - Struct object
    
    private let const = Constants()
    
    
    // MARK: - ViewController lyfecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupGesture()
    }
    
    // MARK: - Functions
    
    private func setupGesture() {
        
        let tapGestureOnView = UITapGestureRecognizer(target: self, action: #selector(didTap))
        
        view.addGestureRecognizer(tapGestureOnView)
    }
    
    /// Creating a new circle of random color according to the conditions.
    @objc
    private func didTap(_ gesture: UITapGestureRecognizer) {
        
        let newCircle = UIView()
        var circleAppended = false
        
        repeat {
            
            // Deleting an existing circle by tap
            
            for (index, circle) in arrayOfCircles.enumerated() {
                
                let location = gesture.location(in: circle)
                
                if (location.x > 0 && location.x < const.circleWidth) && (location.y > 0 && location.y < const.circleHeight) {
                    circle.removeFromSuperview()
                    arrayOfCircles.remove(at: index)
                    
                    return
                }
            }
            
            let point = gesture.location(in: view)
            
            newCircle.frame = CGRect(x: point.x - (const.circleWidth / 2), y: point.y - (const.circleHeight / 2), width: const.circleWidth, height: const.circleHeight)
            newCircle.backgroundColor = .randomColor()
            newCircle.clipsToBounds = true
            newCircle.layer.cornerRadius = newCircle.bounds.height / 2
            
            arrayOfCircles.append(newCircle)
            view.addSubview(newCircle)
            circleAppended = true
            
        } while !circleAppended
    }
}

extension ViewControllerRandomCircles {
    
    private struct Constants {
        
        let circleWidth: CGFloat = 100
        let circleHeight: CGFloat = 100
    }
}

