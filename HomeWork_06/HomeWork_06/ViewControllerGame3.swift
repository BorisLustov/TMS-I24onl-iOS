//
//  ViewControllerGame3.swift
//  HomeWork_06
//
//  Created by Борис Лустов on 21.06.22.
//

import UIKit

class ViewControllerGame3: UIViewController {
    
    let ball: UIView = UIView()
    let areaForBall: UIView = UIView()
    
    // Creating coordinates of ball
    var xBall = 0
    var yBall = 0
    
    let widthBall = 100
    let heightBall = 100
    
    // Ball movement step
    let step = 25
    
    // Movement buttons
    let upBallBtn: UIButton = UIButton()
    let downBallBtn: UIButton = UIButton()
    let leftBallBtn: UIButton = UIButton()
    let rightBallBtn: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .randomColor()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Width and heigth controll buttons
        let widthBtn = 80
        let heightBtn = 35
        
        // Create of movement area for ball
        let widthArea = Int(view.bounds.width)
        let heightArea = Int(view.bounds.height) - (heightBtn * 5)
        
        areaForBall.frame = CGRect(x: 0, y: 0, width: widthArea, height: heightArea)
        areaForBall.backgroundColor = .randomColor()
        view.addSubview(areaForBall)
        
        // Create ball with parameters
        xBall = (Int(areaForBall.bounds.width) / 2) - (widthBall / 2)
        yBall = (Int(areaForBall.bounds.height) / 2) - (heightBall / 2)
        
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
        ball.backgroundColor = .randomColor()
        ball.layer.cornerRadius = ball.bounds.height / 2
        
        areaForBall.addSubview(ball)
        
        // Create UP button with parameters
        let xUpBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yUpBtn = Int(view.bounds.height) - (heightBtn * 4)
        
        upBallBtn.frame = CGRect(x: xUpBtn, y: yUpBtn, width: widthBtn, height: heightBtn)
        upBallBtn.backgroundColor = .gray
        upBallBtn.layer.cornerRadius = upBallBtn.bounds.height / 2
        upBallBtn.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        upBallBtn.setTitle("UP", for: .normal)
        
        view.addSubview(upBallBtn)
        
        // Create DOWN button with parameters
        let xDownBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yDownBtn = Int(view.bounds.height) - (heightBtn * 2)
        
        downBallBtn.frame = CGRect(x: xDownBtn, y: yDownBtn, width: widthBtn, height: heightBtn)
        downBallBtn.backgroundColor = .gray
        downBallBtn.layer.cornerRadius = downBallBtn.bounds.height / 2
        downBallBtn.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
        downBallBtn.setTitle("DOWN", for: .normal)
        
        view.addSubview(downBallBtn)
        
        // Create LEFT button with parameters
        let xLeftBtn = (Int(view.bounds.width) / 2) - widthBtn - (widthBtn / 2)
        let yLeftBtn = Int(view.bounds.height) - (heightBtn * 3)
        
        leftBallBtn.frame = CGRect(x: xLeftBtn, y: yLeftBtn, width: widthBtn, height: heightBtn)
        leftBallBtn.backgroundColor = .gray
        leftBallBtn.layer.cornerRadius = leftBallBtn.bounds.height / 2
        leftBallBtn.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
        leftBallBtn.setTitle("LEFT", for: .normal)
        
        view.addSubview(leftBallBtn)
        
        // Create RIGHT button with parameters
        let xRightBtn = (Int(view.bounds.width) / 2) + widthBtn - (widthBtn / 2)
        let yRightBtn = Int(view.bounds.height) - (heightBtn * 3)
        
        rightBallBtn.frame = CGRect(x: xRightBtn, y: yRightBtn, width: widthBtn, height: heightBtn)
        rightBallBtn.backgroundColor = .gray
        rightBallBtn.layer.cornerRadius = rightBallBtn.bounds.height / 2
        rightBallBtn.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
        rightBallBtn.setTitle("RIGHT", for: .normal)
        
        view.addSubview(rightBallBtn)
    }
    
    /// Move the ball up
    @objc func moveUp() {
        if yBall > (Int(areaForBall.frame.minY) + step) {
            yBall -= step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
    /// Move the ball down
    @objc func moveDown() {
        if yBall < ((Int(areaForBall.frame.maxY) - heightBall) - step)  {
            yBall += step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
    /// Move the ball left
    @objc func moveLeft() {
        if xBall > (Int(areaForBall.frame.minX) + step)  {
            xBall -= step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
    /// Move the ball right
    @objc func moveRight() {
        if xBall < ((Int(areaForBall.frame.maxX) - heightBall) - step)  {
            xBall += step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
}
