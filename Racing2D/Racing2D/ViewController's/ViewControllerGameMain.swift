//
//  ViewControllerGameMain.swift
//  Racing2D
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

enum CarMoveDirection {
    case left, right
}

class ViewControllerGameMain: UIViewController {
    
    // MARK: - UIImage
    
    private let stripesStackView = UIStackView()
    private let carImageView = UIImageView()
    private let barrierCarImageView = UIImageView()
    
    // MARK: - UIView
    
    private let roadsideLeftView = UIView()
    private let roadsideRightView = UIView()
    
    private let navBarView = UIView()
    
    // MARK: - Struct objects
    
    private let const = Constants()
    private var variable = Variables()
    
    // MARK: - ViewController Lyfecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        title = "Game"
        
        setupStripesStackView()
        setupStripes()
        animateStripesMove()
        setupRoadsides()
        setupCarView()
        setupCarSwipeGesture()
        animateBarrierCarMove()
        setupNavBarView()
    }
    
    // MARK: - Functions
    
    private func setupStripesStackView() {
        
        stripesStackView.translatesAutoresizingMaskIntoConstraints = false
        stripesStackView.axis = .vertical
        stripesStackView.alignment = .center
        stripesStackView.spacing = 100
        
        NSLayoutConstraint.activate([
            stripesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stripesStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: -100)
        ])
        
        view.addSubview(stripesStackView)
    }
    
    private func setupStripes() {
        
        variable.stripeWidth = view.bounds.width / 40
        variable.stripeHeight = view.bounds.height / 10
        
        for _ in 1...7 {
            
            let stripe = UIView()
            
            stripe.backgroundColor = .white
            stripe.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                stripe.widthAnchor.constraint(equalToConstant: variable.stripeWidth),
                stripe.heightAnchor.constraint(equalToConstant: variable.stripeHeight)
            ])
            
            stripesStackView.addArrangedSubview(stripe)
        }
    }
    
    private func animateStripesMove() {
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveLinear
        ) {
            self.variable.stripesOriginY = self.stripesStackView.frame.origin.y
            self.stripesStackView.frame.origin.y = 200
        } completion: { _ in
            self.stripesStackView.frame.origin.y = self.variable.stripesOriginY
            self.animateStripesMove()
        }
    }
    
    private func setupRoadsides() {
        
        roadsideLeftView.backgroundColor = .green.withAlphaComponent(0.5)
        roadsideRightView.backgroundColor = .green.withAlphaComponent(0.5)
        
        variable.roadsideWidth = view.bounds.width / 7
        variable.roadsideHeight = view.bounds.height
        
        roadsideLeftView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: variable.roadsideWidth, height: variable.roadsideHeight)
        roadsideRightView.frame = CGRect(x: view.frame.maxX - variable.roadsideWidth, y: view.frame.minY, width: variable.roadsideWidth, height: variable.roadsideHeight)
        
        view.addSubview(roadsideRightView)
        view.addSubview(roadsideLeftView)
    }
    
    private func startCoordinateCarView() {
        
        variable.carWidth = view.bounds.width / 6
        variable.carHeight = variable.carWidth + 50
        
        variable.carXCoord = view.center.x + 20
        variable.carYCoord = view.frame.maxY - (variable.carHeight + 50)
        
        carImageView.frame = CGRect(x: variable.carXCoord, y: variable.carYCoord, width: variable.carWidth, height: variable.carHeight)
    }
    
    private func setupCarView() {
        
        startCoordinateCarView()
        
        carImageView.image = UIImage(named: "car")
        carImageView.contentMode = .scaleToFill
        
        view.addSubview(carImageView)
    }
    
    private func setupCarSwipeGesture() {
        
        carImageView.isUserInteractionEnabled = true
        
        let carSwipeLeft = UISwipeGestureRecognizer()
        let carSwipeRight = UISwipeGestureRecognizer()
        
        carSwipeLeft.direction = .left
        carSwipeRight.direction = .right
        
        carSwipeLeft.addTarget(self, action: #selector(carMoveLeft))
        carSwipeRight.addTarget(self, action: #selector(carMoveRight))
        
        carImageView.addGestureRecognizer(carSwipeLeft)
        carImageView.addGestureRecognizer(carSwipeRight)
    }
    
    private func setupBarrierCar() {
        
        view.addSubview(barrierCarImageView)
        
        barrierCarImageView.center.x = CGFloat(Int.random(in: Int(variable.roadsideWidth + (variable.carWidth / 2))...Int(view.bounds.maxX - variable.roadsideWidth - (variable.carWidth / 2))))
        barrierCarImageView.center.y = 0
        barrierCarImageView.bounds = CGRect(x: 0, y: 0, width: variable.carWidth, height: variable.carHeight)
        barrierCarImageView.image = UIImage(named: "car2")
    }
    
    private func animateBarrierCarMove() {
        
        setupBarrierCar()
        
        UIView.animate(
            withDuration: 2.5,
            delay: 0,
            options: .curveLinear
        ) {
            self.barrierCarImageView.frame.origin.y = self.carImageView.frame.origin.y - (self.variable.carHeight / 1.5)
        } completion: { _ in
            self.checkCarCrash()
        }
    }
    
    private func checkCarCrash() {
        if carImageView.frame.intersects(barrierCarImageView.frame) {
            crashAlert()
        } else {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                options: .curveLinear
            ) {
                self.barrierCarImageView.frame.origin.y = self.view.frame.maxY
            } completion: { _ in
                self.animateBarrierCarMove()
                self.setupNavBarView()
            }
        }
    }
    
    private func setupNavBarView() {
        
        navBarView.backgroundColor = .white
        navBarView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 10)
        
        view.addSubview(navBarView)
    }
    
    private func crashAlert() {
        
        let alert: UIAlertController = UIAlertController(
            title: "GAME OVER",
            message: "CRASH",
            preferredStyle: .alert
        )
        
        // Exit to the Menu
        alert.addAction(UIAlertAction(
            title: "Quit",
            style: .destructive
        ) {_ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        )
        
        // Start new game
        alert.addAction(UIAlertAction(
            title: "New Game",
            style: .default
        ) {_ in
            if self.carImageView.frame.intersects(self.barrierCarImageView.frame) {
                self.animateBarrierCarMove()
            }
            self.startCoordinateCarView()
            self.setupNavBarView()
        }
        )
        self.present(alert, animated: true)
    }
    
    private func moveCarTo(_ direction: CarMoveDirection) {
        
        switch direction {
        case .left:
            variable.carXCoord -= const.carMoveStep
        case .right:
            variable.carXCoord += const.carMoveStep
        }
        carImageView.frame = CGRect(x: variable.carXCoord, y: variable.carYCoord, width: variable.carWidth, height: variable.carHeight)
        checkRoadside()
    }
    
    private func checkRoadside() {
        
        if carImageView.frame.intersects(roadsideLeftView.frame) || carImageView.frame.intersects(roadsideRightView.frame) {
            crashAlert()
        }
    }
    
    // MARK: - Selectors
    
    @objc private func carMoveLeft() {
        moveCarTo(.left)
    }
    
    @objc private func carMoveRight() {
        moveCarTo(.right)
    }
}

extension ViewControllerGameMain {
    
    // MARK: - Variables
    
    private struct Variables {
        
        var stripesOriginY = CGFloat()
        
        var stripeWidth = CGFloat()
        var stripeHeight = CGFloat()
        
        var roadsideWidth = CGFloat()
        var roadsideHeight = CGFloat()
        
        var carWidth = CGFloat()
        var carHeight = CGFloat()
        
        var carXCoord = CGFloat()
        var carYCoord = CGFloat()
    }
    
    // MARK: - Constants
    
    private struct Constants {
        
        let carMoveStep: CGFloat = 40
    }
}
