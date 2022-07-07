//
//  ViewControllerRandomCircles.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerRandomCircles: UIViewController {
    
    // Creating of array of circles
    
    var arrayOfCircles = [UIView]()
    
    // Parameters of circles
    
    let circleWidth = 100
    let circleHeight = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Adding gesture
        
        let tapGestureOnView = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tapGestureOnView)
        
    }
    
    /// Creating a new circle of random color according to the conditions.
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        
        let newCircle = UIView()
        var circleAppended = false
        
        repeat {
            
            // Deleting an existing circle by tap
            
            for (index, circle) in arrayOfCircles.enumerated() {
                
                let location = gesture.location(in: circle)
                
                if (location.x > 0 && location.x < 100) && (location.y > 0 && location.y < 100) {
                    circle.removeFromSuperview()
                    arrayOfCircles.remove(at: index)
                    
                    return
                }
            }
            
            let point = gesture.location(in: view)
            
            newCircle.frame = CGRect(x: Int(point.x) - (circleWidth/2), y: Int(point.y) - (circleHeight/2), width: circleWidth, height: circleHeight)
            newCircle.backgroundColor = .randomColor()
            newCircle.clipsToBounds = true
            newCircle.layer.cornerRadius = newCircle.bounds.height / 2
            
            arrayOfCircles.append(newCircle)
            view.addSubview(newCircle)
            circleAppended = true
            
        } while !circleAppended
    }
}

