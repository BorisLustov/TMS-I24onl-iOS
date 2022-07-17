//
//  ViewControllerMoveCircle.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerMoveCircle: UIViewController {
    
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
        setupGesture()
    }
    
    // MARK: - Functions
    
    private func setupCircleView() {
        
        variable.xCircle = (Int(view.bounds.width) / 2) - (const.widthCircle / 2)
        variable.yCircle = (Int(view.bounds.height) / 2) - (const.heightCircle / 2)
        
        circle.frame = CGRect(x: variable.xCircle, y: variable.yCircle, width: const.widthCircle, height: const.heightCircle)
        circle.backgroundColor = .randomColor()
        circle.clipsToBounds = true
        circle.layer.cornerRadius = circle.bounds.height / 2
        
        view.addSubview(circle)
    }
    
    private func setupGesture() {
        
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(moveCircle))
        
        circle.addGestureRecognizer(swipeGesture)
    }
    
    /// Moving the circle by swipe
    @objc
    private func moveCircle(_ sender: UIPanGestureRecognizer) {
        
        let unwrSenderView = UIView()
        let mySenderView = sender.view ?? unwrSenderView
        
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view)
            mySenderView.center = CGPoint(x: mySenderView.center.x + translation.x, y: mySenderView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
        }
    }
}

extension ViewControllerMoveCircle {
    
    private struct Constants {
        
        let widthCircle = 100
        let heightCircle = 100
    }
    
    private struct Variables {
        
        var xCircle = 0
        var yCircle = 0
    }
}
