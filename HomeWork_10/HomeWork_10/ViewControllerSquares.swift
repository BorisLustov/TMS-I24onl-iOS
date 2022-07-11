//
//  ViewControllerSquares.swift
//  HomeWork_10
//
//  Created by Борис Лустов on 9.07.22.
//

import UIKit

enum Squares {
    case first
    case second
    case third
    case four
}

class ViewControllerSquares: UIViewController {
    
    let squaresView = UIView()
    let square1 = UIView()
    let square2 = UIView()
    let square3 = UIView()
    let square4 = UIView()
    
    let hideSquaresBtn = UIButton()
    
    var squareHeight: NSLayoutConstraint?
    var squareWidth: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        squaresView.backgroundColor = view.backgroundColor
        squaresView.frame = CGRect(x: view.frame.minX, y: view.center.y / 2, width: view.bounds.width, height: view.bounds.width)
        
        square1.backgroundColor = .randomColor()
        square1.translatesAutoresizingMaskIntoConstraints = false
        
        square2.backgroundColor = .randomColor()
        square2.translatesAutoresizingMaskIntoConstraints = false
        
        square3.backgroundColor = .randomColor()
        square3.translatesAutoresizingMaskIntoConstraints = false
        
        square4.backgroundColor = .randomColor()
        square4.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(squaresView)
        view.addSubview(hideSquaresBtn)
        
        squaresView.addSubview(square1)
        squaresView.addSubview(square2)
        squaresView.addSubview(square3)
        squaresView.addSubview(square4)
        
        setupLayautSquare(square: square1)
        setupLayautSquare(square: square2)
        setupLayautSquare(square: square3)
        setupLayautSquare(square: square4)
        
        constraintsSquare1()
        constraintsSquare2()
        constraintsSquare3()
        constraintsSquare4()
        
        swipeGesture(view: square1, numOfSquare: .first)
        swipeGesture(view: square2, numOfSquare: .second)
        swipeGesture(view: square3, numOfSquare: .third)
        swipeGesture(view: square4, numOfSquare: .four)
        
        setupHideButton()
        
    }
    
    func swipeGesture(view: UIView, numOfSquare: Squares) {
        
        let swipeSquareLeft = UISwipeGestureRecognizer()
        let swipeSquareRight = UISwipeGestureRecognizer()
        
        switch numOfSquare {
        case .first:
            swipeSquareLeft.addTarget(self, action: #selector(makeSquare1Smaller))
            swipeSquareRight.addTarget(self, action: #selector(makeSquare1Bigger))
        case .second:
            swipeSquareLeft.addTarget(self, action: #selector(makeSquare2Smaller))
            swipeSquareRight.addTarget(self, action: #selector(makeSquare2Bigger))
        case .third:
            swipeSquareLeft.addTarget(self, action: #selector(makeSquare3Smaller))
            swipeSquareRight.addTarget(self, action: #selector(makeSquare3Bigger))
        case .four:
            swipeSquareLeft.addTarget(self, action: #selector(makeSquare4Smaller))
            swipeSquareRight.addTarget(self, action: #selector(makeSquare4Bigger))
        }

        swipeSquareLeft.direction = .left
        view.addGestureRecognizer(swipeSquareLeft)
        
        swipeSquareRight.direction = .right
        view.addGestureRecognizer(swipeSquareRight)
    }
    
    func setupLayautSquare(square: UIView) {
        
        //        squareHeight = square.heightAnchor.constraint(equalToConstant: squaresView.bounds.height * 0.45)
        //
        //        squareWidth = square.widthAnchor.constraint(equalToConstant: squaresView.bounds.width * 0.45)
        
        let height = NSLayoutConstraint(
            item: square,
            attribute: .height,
            relatedBy: .equal,
            toItem: squaresView,
            attribute: .height,
            multiplier: 0.45,
            constant: 0
        )
        
        let width = NSLayoutConstraint(
            item: square,
            attribute: .width,
            relatedBy: .equal,
            toItem: squaresView,
            attribute: .width,
            multiplier: 0.45,
            constant: 0
        )
        
        height.isActive = true
        width.isActive = true
        
        //        squareHeight?.isActive = true
        //        squareWidth?.isActive = true
    }
    
    func constraintsSquare1() {
        let constraints = [
            square1.topAnchor.constraint(equalTo: squaresView.topAnchor, constant: 10),
            square1.leadingAnchor.constraint(equalTo: squaresView.leadingAnchor, constant: 10),
            square1.trailingAnchor.constraint(equalTo: square2.leadingAnchor, constant: -20),
            square1.bottomAnchor.constraint(equalTo: square3.topAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func constraintsSquare2() {
        let constraints = [
            square2.leadingAnchor.constraint(equalTo: square1.trailingAnchor, constant: 20),
            square2.bottomAnchor.constraint(equalTo: square1.bottomAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func constraintsSquare3() {
        let constraints = [
            square3.topAnchor.constraint(equalTo: square1.bottomAnchor, constant: -20),
            square3.leadingAnchor.constraint(equalTo: square1.leadingAnchor, constant: 0),
            square3.trailingAnchor.constraint(equalTo: square4.leadingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func constraintsSquare4() {
        let constraints = [
            square4.topAnchor.constraint(equalTo: square3.topAnchor, constant: 0),
            square4.leadingAnchor.constraint(equalTo: square3.trailingAnchor, constant: 20)
        ]
        constraints[0].priority = UILayoutPriority(999)
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupHideButton() {
        
        let widthBtn = 150
        let heightBtn = 50
        let xBtn = Int(view.center.x) - (widthBtn / 2)
        let yBtn = Int(view.frame.maxY) - (heightBtn * 2)
        
        hideSquaresBtn.frame = CGRect(x: xBtn, y: yBtn, width: widthBtn, height: heightBtn)
        hideSquaresBtn.backgroundColor = .black
        hideSquaresBtn.layer.cornerRadius = hideSquaresBtn.bounds.height / 2
        hideSquaresBtn.clipsToBounds = true
        hideSquaresBtn.setTitle("Hide Squares", for: .normal)
        hideSquaresBtn.addTarget(self, action: #selector(hideSquares), for: .touchUpInside)
    }
    
    func transformSquare(square: UIView, multy: CGFloat) {
        
        let height = NSLayoutConstraint(
            item: square,
            attribute: .height,
            relatedBy: .equal,
            toItem: squaresView,
            attribute: .height,
            multiplier: multy,
            constant: 0
        )
        
        let width = NSLayoutConstraint(
            item: square,
            attribute: .width,
            relatedBy: .equal,
            toItem: squaresView,
            attribute: .width,
            multiplier: multy,
            constant: 0
        )
        
        height.isActive = true
        width.isActive = true
    }
    
    //    func transform(view: UIView) {
    //        self.squareHeight?.constant = squaresView.bounds.height * 0.6
    //        self.squareWidth?.constant = squaresView.bounds.width * 0.6
    //
    //        view.heightAnchor.constraint(equalToConstant: squareHeight!.constant).isActive = true
    //        view.widthAnchor.constraint(equalToConstant: squareWidth!.constant).isActive = true
    //
    //        self.view.layoutIfNeeded()
    //    }
    
    @objc
    func hideSquares() {
        if squaresView.isHidden == false {
            squaresView.isHidden = true
        } else {
            squaresView.isHidden = false
        }
    }
    
    @objc
    func makeSquare1Smaller() {
        transformSquare(square: square1, multy: 0.3)
    }
    
    @objc
    func makeSquare1Bigger() {
        transformSquare(square: square1, multy: 0.6)
    }
    
    @objc
    func makeSquare2Smaller() {
        transformSquare(square: square2, multy: 0.3)
    }
    
    @objc
    func makeSquare2Bigger() {
        transformSquare(square: square2, multy: 0.6)
    }
    
    @objc
    func makeSquare3Smaller() {
        transformSquare(square: square3, multy: 0.3)
    }
    
    @objc
    func makeSquare3Bigger() {
        transformSquare(square: square3, multy: 0.6)
    }
    
    @objc
    func makeSquare4Smaller() {
        transformSquare(square: square4, multy: 0.3)
    }
    
    @objc
    func makeSquare4Bigger() {
        transformSquare(square: square4, multy: 0.6)
    }
    
}
