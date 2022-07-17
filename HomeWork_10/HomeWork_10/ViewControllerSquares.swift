//
//  ViewControllerSquares.swift
//  HomeWork_10
//
//  Created by Борис Лустов on 9.07.22.
//

import UIKit

enum Squares {
    case first, second, third, four
}

class ViewControllerSquares: UIViewController {
    
    // MARK: - UIView
    
    private let squaresView = UIView()
    private let squareOne = UIView()
    private let squareTwo = UIView()
    private let squareThree = UIView()
    private let squareFour = UIView()
    
    // MARK: - UIButton
    
    private let hideSquaresButton = UIButton()
    
    // MARK: - Struct objects
    
    private let const = Constants()
    
    // MARK: View Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupSquaresView()
        setupHideSquaresButton()
        
        setupSquareView(squareOne)
        setupSquareView(squareTwo)
        setupSquareView(squareThree)
        setupSquareView(squareFour)
        
        setupConstraintsSquareView(.first)
        setupConstraintsSquareView(.second)
        setupConstraintsSquareView(.third)
        setupConstraintsSquareView(.four)
        
        setupSwipeGesture(view: squareOne, numOfSquare: .first)
        setupSwipeGesture(view: squareTwo, numOfSquare: .second)
        setupSwipeGesture(view: squareThree, numOfSquare: .third)
        setupSwipeGesture(view: squareFour, numOfSquare: .four)
        
    }
    
    // MARK: - Functions
    
    private func setupSquaresView() {
        
        squaresView.backgroundColor = view.backgroundColor
        squaresView.frame = CGRect(x: view.frame.minX, y: view.center.y / 2, width: view.bounds.width, height: view.bounds.width)
        
        view.addSubview(squaresView)
    }
    
    private func setupHideSquaresButton() {
        
        let xButton = Int(view.center.x) - (const.widthButton / 2)
        let yButton = Int(view.frame.maxY) - (const.heightButton * 2)
        
        hideSquaresButton.frame = CGRect(x: xButton, y: yButton, width: const.widthButton, height: const.heightButton)
        hideSquaresButton.backgroundColor = .black
        hideSquaresButton.layer.cornerRadius = hideSquaresButton.bounds.height / 2
        hideSquaresButton.clipsToBounds = true
        hideSquaresButton.setTitle("Hide Squares", for: .normal)
        hideSquaresButton.addTarget(self, action: #selector(hideSquares), for: .touchUpInside)
        
        view.addSubview(hideSquaresButton)
    }
    
    private func setupSquareView(_ square: UIView) {
        
        square.backgroundColor = .randomColor()
        square.translatesAutoresizingMaskIntoConstraints = false
        
        squaresView.addSubview(square)
        
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
    }
    
    private func setupConstraintsSquareView(_ square: Squares) {
        
        var constraints = [NSLayoutConstraint]()
        
        switch square {
        case .first:
            constraints = [
                squareOne.topAnchor.constraint(equalTo: squaresView.topAnchor, constant: 10),
                squareOne.leadingAnchor.constraint(equalTo: squaresView.leadingAnchor, constant: 10),
                squareOne.trailingAnchor.constraint(equalTo: squareTwo.leadingAnchor, constant: -20),
                squareOne.bottomAnchor.constraint(equalTo: squareThree.topAnchor, constant: -20)
            ]
        case .second:
            constraints = [
                squareTwo.leadingAnchor.constraint(equalTo: squareOne.trailingAnchor, constant: 20),
                squareTwo.bottomAnchor.constraint(equalTo: squareOne.bottomAnchor, constant: 0)
            ]
        case .third:
            constraints = [
                squareThree.topAnchor.constraint(equalTo: squareOne.bottomAnchor, constant: -20),
                squareThree.leadingAnchor.constraint(equalTo: squareOne.leadingAnchor, constant: 0),
                squareThree.trailingAnchor.constraint(equalTo: squareFour.leadingAnchor, constant: -20)
            ]
        case .four:
            constraints = [
                squareFour.topAnchor.constraint(equalTo: squareThree.topAnchor, constant: 0),
                squareFour.leadingAnchor.constraint(equalTo: squareThree.trailingAnchor, constant: 20)
            ]
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupSwipeGesture(view: UIView, numOfSquare: Squares) {
        
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
    
    /// Changing the size of a square
    private func transformSquare(square: UIView, multy: CGFloat) {
        
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
    
    // MARK: - Selectors
    
    @objc
    private func hideSquares() {
        if squaresView.isHidden {
            squaresView.isHidden = false
        } else {
            squaresView.isHidden = true
        }
    }
    
    @objc
    private func makeSquare1Smaller() {
        transformSquare(square: squareOne, multy: 0.3)
    }
    
    @objc
    private func makeSquare1Bigger() {
        transformSquare(square: squareOne, multy: 0.6)
    }
    
    @objc
    private func makeSquare2Smaller() {
        transformSquare(square: squareTwo, multy: 0.3)
    }
    
    @objc
    private func makeSquare2Bigger() {
        transformSquare(square: squareTwo, multy: 0.6)
    }
    
    @objc
    private func makeSquare3Smaller() {
        transformSquare(square: squareThree, multy: 0.3)
    }
    
    @objc
    private func makeSquare3Bigger() {
        transformSquare(square: squareThree, multy: 0.6)
    }
    
    @objc
    private func makeSquare4Smaller() {
        transformSquare(square: squareFour, multy: 0.3)
    }
    
    @objc
    private func makeSquare4Bigger() {
        transformSquare(square: squareFour, multy: 0.6)
    }
    
}

extension ViewControllerSquares {
    
    private struct Constants {
        
        let widthButton = 150
        let heightButton = 50
    }
}
