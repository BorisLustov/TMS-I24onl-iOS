//
//  ViewControllerGame3.swift
//  HomeWork_06
//
//  Created by Борис Лустов on 21.06.22.
//

// Game3 Moving ball

import UIKit

enum MoveBall {
    
    case up
    case down
    case left
    case right
}

class ViewControllerGame3: UIViewController {
    
    // Views for ball
    let ball = UIView()
    let areaForBall = UIView()
    
    // Movement buttons
    let upBallBtn = UIButton()
    let downBallBtn = UIButton()
    let leftBallBtn = UIButton()
    let rightBallBtn = UIButton()
   
    // Coordinates and parameters of ball
    var xBall = 0
    var yBall = 0
    let widthBall = 100
    let heightBall = 100
    
    // Width and heigth controll buttons
    let widthBtn = 80
    let heightBtn = 35
    
    // Ball movement step
    let step = 25
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .randomColor()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

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
        
        /// Setting the parameters of the movement button from the direction
        func moveBtn(button: UIButton, moveTo: MoveBall) {
            
            // Button coordinates
            var xBtn = 0
            var yBtn = 0
           
            switch moveTo {
                
            case .up:
                xBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
                yBtn = Int(view.bounds.height) - (heightBtn * 4)
                button.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
                button.setTitle("UP", for: .normal)
                
            case .down:
                xBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
                yBtn = Int(view.bounds.height) - (heightBtn * 2)
                button.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
                button.setTitle("DOWN", for: .normal)
                
            case .left:
                xBtn = (Int(view.bounds.width) / 2) - widthBtn - (widthBtn / 2)
                yBtn = Int(view.bounds.height) - (heightBtn * 3)
                button.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
                button.setTitle("LEFT", for: .normal)
                
            case .right:
                xBtn = (Int(view.bounds.width) / 2) + widthBtn - (widthBtn / 2)
                yBtn = Int(view.bounds.height) - (heightBtn * 3)
                button.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
                button.setTitle("RIGHT", for: .normal)
            }
            
            button.frame = CGRect(x: xBtn, y: yBtn, width: widthBtn, height: heightBtn)
            button.backgroundColor = .gray
            button.layer.cornerRadius = button.bounds.height / 2
            view.addSubview(button)
        }
        
        // Create movement buttons with parameters
        moveBtn(button: upBallBtn, moveTo: .up)
        moveBtn(button: downBallBtn, moveTo: .down)
        moveBtn(button: leftBallBtn, moveTo: .left)
        moveBtn(button: rightBallBtn, moveTo: .right)
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
