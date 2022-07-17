//
//  ViewControllerInfCircle.swift
//  HomeWork_11
//
//  Created by Борис Лустов on 12.07.22.
//

import UIKit

enum CircleDirection {
    case up, down, left, right
}

class ViewControllerInfCircle: UIViewController {
    
    // MARK: - UIView
    
    private let circle = UIView()
    private let viewForCircle = UIView()
    
    // MARK: - Struct objects
    
    private let const = Constants()
    private var variable = Variables()
    
    // MARK: - View lyfecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Infinity Circle"
        view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupViewForCircle()
        setupCircleView()
                
        moveCircleTo(.up)
    }
    
    // MARK: - Functions
    
    private func setupViewForCircle() {

        viewForCircle.backgroundColor = view.backgroundColor
        viewForCircle.frame = CGRect(x: view.frame.minX, y: view.center.y / 2, width: view.bounds.width, height: view.bounds.width)

        view.addSubview(viewForCircle)

    }

    private func setupCircleView() {

        circle.backgroundColor = .randomColor()
        circle.frame = CGRect(x: Int(viewForCircle.bounds.minX), y: Int(viewForCircle.bounds.maxY) - const.circleWidth, width: const.circleWidth, height: const.circleWidth)
        circle.layer.cornerRadius = circle.bounds.width / 2
        circle.clipsToBounds = true

        viewForCircle.addSubview(circle)
    }
    
    private func moveCircleTo(_ direction: CircleDirection) {
        
        UIView.animate(
            withDuration: const.duration,
            delay: TimeInterval(const.delay),
            options: .curveLinear
        ) {
            switch direction {
            case .up:
                self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.minX), y: Int(self.viewForCircle.bounds.minY), width: self.const.circleWidth, height: self.const.circleWidth)
            case .down:
                self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.maxX) - self.const.circleWidth, y: Int(self.viewForCircle.bounds.maxY) - self.const.circleWidth, width: self.const.circleWidth, height: self.const.circleWidth)
            case .left:
                self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.minX), y: Int(self.viewForCircle.bounds.maxY) - self.const.circleWidth, width: self.const.circleWidth, height: self.const.circleWidth)
            case .right:
                self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.maxX) - self.const.circleWidth, y: Int(self.viewForCircle.bounds.minY), width: self.const.circleWidth, height: self.const.circleWidth)
            }
        } completion: { _ in
            switch direction {
            case .up:
                self.moveCircleTo(.right)
            case .down:
                self.moveCircleTo(.left)
            case .left:
                self.moveCircleTo(.up)
            case .right:
                self.moveCircleTo(.down)
            }
        }
    }
}

extension ViewControllerInfCircle {
        
    private struct Constants {
        
        let circleWidth = 100
        
        let duration = 0.5
        let delay = 0
    }
        
    private struct Variables {
        
        var start = false
    }
}
