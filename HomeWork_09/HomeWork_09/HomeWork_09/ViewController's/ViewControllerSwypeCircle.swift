//
//  ViewControllerSwypeCircle.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerSwypeCircle: UIViewController {
    
    let ball = UIView()
    
    // Coordinates and parameters of ball
    var xBall = 0
    var yBall = 0
    let widthBall = 100
    let heightBall = 100
    
    // Ball movement step
    let step = 25

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
                
    }

    public override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

        // Create ball with parameters
        xBall = (Int(view.bounds.width) / 2) - (widthBall / 2)
        yBall = (Int(view.bounds.height) / 2) - (heightBall / 2)
        
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
        ball.backgroundColor = .randomColor()
        ball.clipsToBounds = true
        ball.layer.cornerRadius = ball.bounds.height / 2
        
        view.addSubview(ball)
        
        let swypeBallUp = UISwipeGestureRecognizer(target: self, action: #selector(moveBallUp))
        swypeBallUp.direction = .up
        view.addGestureRecognizer(swypeBallUp)
        
        let swypeBallDown = UISwipeGestureRecognizer(target: self, action: #selector(moveBallDown))
        swypeBallDown.direction = .down
        view.addGestureRecognizer(swypeBallDown)
        
        let swypeBallLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveBallLeft))
        swypeBallLeft.direction = .left
        view.addGestureRecognizer(swypeBallLeft)
        
        let swypeBallRight = UISwipeGestureRecognizer(target: self, action: #selector(moveBallRight))
        swypeBallRight.direction = .right
        view.addGestureRecognizer(swypeBallRight)

    }

    /// Move the ball up
    @objc func moveBallUp() {
        if yBall > (Int(view.frame.minY) + step) {
            yBall -= step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
    /// Move the ball down
    @objc func moveBallDown() {
        if yBall < ((Int(view.frame.maxY) - heightBall) - step)  {
            yBall += step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
    /// Move the ball left
    @objc func moveBallLeft() {
        if xBall > (Int(view.frame.minX) + step)  {
            xBall -= step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
    /// Move the ball right
    @objc func moveBallRight() {
        if xBall < ((Int(view.frame.maxX) - heightBall) - step)  {
            xBall += step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    }
    
}
