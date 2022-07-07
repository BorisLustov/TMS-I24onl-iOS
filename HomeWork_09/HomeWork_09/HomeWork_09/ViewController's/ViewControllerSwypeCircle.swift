//
//  ViewControllerSwypeCircle.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerSwypeCircle: UIViewController {
    
    let circle = UIView()
    
    // Coordinates and parameters of circle
    var xCircle = 0
    var yCircle = 0
    let widthCircle = 100
    let heightCircle = 100
    
    // Circle movement step
    let step = 25

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
                
    }

    public override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

        // Create circle with parameters
        
        xCircle = (Int(view.bounds.width) / 2) - (widthCircle / 2)
        yCircle = (Int(view.bounds.height) / 2) - (heightCircle / 2)
        
        circle.frame = CGRect(x: xCircle, y: yCircle, width: widthCircle, height: heightCircle)
        circle.backgroundColor = .randomColor()
        circle.clipsToBounds = true
        circle.layer.cornerRadius = circle.bounds.height / 2
        
        view.addSubview(circle)
        
        // Setting gestures
        
        let swypeCircleUp = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleUp))
        swypeCircleUp.direction = .up
        view.addGestureRecognizer(swypeCircleUp)
        
        let swypeCircleDown = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleDown))
        swypeCircleDown.direction = .down
        view.addGestureRecognizer(swypeCircleDown)
        
        let swypeCircleLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleLeft))
        swypeCircleLeft.direction = .left
        view.addGestureRecognizer(swypeCircleLeft)
        
        let swypeCircleRight = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleRight))
        swypeCircleRight.direction = .right
        view.addGestureRecognizer(swypeCircleRight)

    }

    /// Move the circle up
    @objc func moveCircleUp() {
        if yCircle > (Int(view.frame.minY) + step) {
            yCircle -= step
        }
        circle.frame = CGRect(x: xCircle, y: yCircle, width: widthCircle, height: heightCircle)
    }
    
    /// Move the circle down
    @objc func moveCircleDown() {
        if yCircle < ((Int(view.frame.maxY) - heightCircle) - step)  {
            yCircle += step
        }
        circle.frame = CGRect(x: xCircle, y: yCircle, width: widthCircle, height: heightCircle)
    }
    
    /// Move the circle left
    @objc func moveCircleLeft() {
        if xCircle > (Int(view.frame.minX) + step)  {
            xCircle -= step
        }
        circle.frame = CGRect(x: xCircle, y: yCircle, width: widthCircle, height: heightCircle)
    }
    
    /// Move the circle right
    @objc func moveCircleRight() {
        if xCircle < ((Int(view.frame.maxX) - heightCircle) - step)  {
            xCircle += step
        }
        circle.frame = CGRect(x: xCircle, y: yCircle, width: widthCircle, height: heightCircle)
    }
    
}
