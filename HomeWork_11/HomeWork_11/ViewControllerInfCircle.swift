//
//  ViewControllerInfCircle.swift
//  HomeWork_11
//
//  Created by Борис Лустов on 12.07.22.
//

import UIKit

class ViewControllerInfCircle: UIViewController {
    
    // MARK: - UIViews
    
    let circle = UIView()
    let viewForCircle = UIView()
    
    // MARK: - UIButtons
    
    let startBtn = UIButton()
    
    // MARK: - Constants
    
    let widthBtn = 100
    let heightBtn = 50
    
    let circleWidth = 100
    
    let duration = 0.5
    let delay = 0
    
    // MARK: - Variables
    
    var start = false
    
    // MARK: - View lyfecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Infinity Circle"
        
        view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupViewForCircle()
        //setupStartButton()
        setupCircleView()
        
        view.addSubview(viewForCircle)
        view.addSubview(startBtn)
        viewForCircle.addSubview(circle)
        
        startCircleMove()
    }
    
    // MARK: - Functions
    
    /// Setting parameters for the circle movement field
    func setupViewForCircle() {
        
        viewForCircle.backgroundColor = view.backgroundColor
        viewForCircle.frame = CGRect(x: view.frame.minX, y: view.center.y / 2, width: view.bounds.width, height: view.bounds.width)
    }
    
    /// Setting the parameters of the circle
    func setupCircleView() {
        
        circle.backgroundColor = .randomColor()
        circle.frame = CGRect(x: Int(viewForCircle.bounds.minX), y: Int(viewForCircle.bounds.maxY) - circleWidth, width: circleWidth, height: circleWidth)
        circle.layer.cornerRadius = circle.bounds.width / 2
        circle.clipsToBounds = true
    }
    
//    func setupStartButton() {
//
//        let xBtn = Int(view.center.x) - (widthBtn / 2)
//        let yBtn = Int(view.bounds.maxY) - (heightBtn * 2)
//
//        startBtn.frame = CGRect(x: xBtn, y: yBtn, width: widthBtn, height: heightBtn)
//        startBtn.backgroundColor = .black
//        startBtn.layer.cornerRadius = startBtn.bounds.height / 2
//        startBtn.clipsToBounds = true
//        startBtn.setTitle("Start", for: .normal)
//        startBtn.addTarget(self, action: #selector(ifStart), for: .touchUpInside)
//    }
    
    /// Starting animation of the circle movement
    func startCircleMove() {
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(delay),
            options: .curveLinear
        ) {
            self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.minX), y: Int(self.viewForCircle.bounds.minY), width: self.circleWidth, height: self.circleWidth)
        } completion: { _ in
            self.secondCircleMove()
        }
    }
    
    /// Second animation of the circle movement
    func secondCircleMove() {
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(delay),
            options: .curveLinear
        ) {
            self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.maxX) - self.circleWidth, y: Int(self.viewForCircle.bounds.minY), width: self.circleWidth, height: self.circleWidth)
        } completion: { _ in
            self.thirdCircleMove()
        }
    }
    
    /// Third animation of the circle movement
    func thirdCircleMove() {
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(delay),
            options: .curveLinear
        ) {
            self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.maxX) - self.circleWidth, y: Int(self.viewForCircle.bounds.maxY) - self.circleWidth, width: self.circleWidth, height: self.circleWidth)
        } completion: { _ in
            self.finalCircleMove()
        }
    }
    
    /// Final animation of the circle movement
    func finalCircleMove() {
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(delay),
            options: .curveLinear
        ) {
            self.circle.frame = CGRect(x: Int(self.viewForCircle.bounds.minX), y: Int(self.viewForCircle.bounds.maxY) - self.circleWidth, width: self.circleWidth, height: self.circleWidth)
        } completion: { _ in
            self.startCircleMove()
        }
    }
    
//    @objc
//    func ifStart() {
//        if start == false {
//            start = true
//        } else {
//            start = false
//        }
//
//        print(start)
//    }
}
