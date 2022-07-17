//
//  ViewControllerSwypeCircle.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerSwypeCircle: UIViewController {
    
    // MARK: - UIView
    
    private let circle = UIView()
    
    // MARK: - Struct objects
    
    private let const = Constants()
    private var variable = Variables()
    
    // MARK: - ViewController lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupCircleView()
        setupSwipeGesture(.up)
        setupSwipeGesture(.down)
        setupSwipeGesture(.left)
        setupSwipeGesture(.right)
    }
    
    private func setupCircleView() {
        
        variable.xCircle = (view.bounds.width / 2) - (const.widthCircle / 2)
        variable.yCircle = (view.bounds.height / 2) - (const.heightCircle / 2)
        
        circle.frame = CGRect(x: variable.xCircle, y: variable.yCircle, width: const.widthCircle, height: const.heightCircle)
        circle.backgroundColor = .randomColor()
        circle.clipsToBounds = true
        circle.layer.cornerRadius = circle.bounds.height / 2
        
        view.addSubview(circle)
    }
        
    private func setupSwipeGesture(_ swipe: UISwipeGestureRecognizer.Direction) {
        
        var swipeGesture = UISwipeGestureRecognizer()
        
        switch swipe {
        case .up:
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleUp))
            swipeGesture.direction = .up
        case .down:
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleDown))
            swipeGesture.direction = .down
        case .left:
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleLeft))
            swipeGesture.direction = .left
        case .right:
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleRight))
            swipeGesture.direction = .right
        default:
            break
        }
        
        view.addGestureRecognizer(swipeGesture)
    }
    
    /// Move the circle up
    @objc
    private func moveCircleUp() {
        if variable.yCircle > view.frame.minY + const.step {
            variable.yCircle -= const.step
        }
        circle.frame = CGRect(x: variable.xCircle, y: variable.yCircle, width: const.widthCircle, height: const.heightCircle)
    }
    
    /// Move the circle down
    @objc
    private func moveCircleDown() {
        if variable.yCircle < view.frame.maxY - const.heightCircle - const.step {
            variable.yCircle += const.step
        }
        circle.frame = CGRect(x: variable.xCircle, y: variable.yCircle, width: const.widthCircle, height: const.heightCircle)
    }
    
    /// Move the circle left
    @objc
    private func moveCircleLeft() {
        if variable.xCircle > view.frame.minX + const.step {
            variable.xCircle -= const.step
        }
        circle.frame = CGRect(x: variable.xCircle, y: variable.yCircle, width: const.widthCircle, height: const.heightCircle)
    }
    
    /// Move the circle right
    @objc
    private func moveCircleRight() {
        if variable.xCircle < view.frame.maxX - const.heightCircle - const.step {
            variable.xCircle += const.step
        }
        circle.frame = CGRect(x: variable.xCircle, y: variable.yCircle, width: const.widthCircle, height: const.heightCircle)
    }
}

extension ViewControllerSwypeCircle {
    
    private struct Constants {
        
        let widthCircle: CGFloat = 100
        let heightCircle: CGFloat = 100
        
        let step: CGFloat = 25
    }
    
    private struct Variables {
        
        var xCircle: CGFloat = 0
        var yCircle: CGFloat = 0
    }
}
