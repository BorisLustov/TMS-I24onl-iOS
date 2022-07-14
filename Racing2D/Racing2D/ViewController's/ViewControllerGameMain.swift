//
//  ViewControllerGameMain.swift
//  Racing2D
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerGameMain: UIViewController {
    
    // MARK: - UIImages
    
    let stripesStackView = UIStackView()
    let carImageView = UIImageView()
    let anotherCarImageView = UIImageView()
    
    // MARK: - UIViews
    
    let borderLeftView = UIView()
    let borderRightView = UIView()
    
    let barView = UIView()
    
    // MARK: - Constants
    
    let carStep: CGFloat = 35
    
    // MARK: - Variables
    
    var stripeWidth = CGFloat()
    var stripeHeight = CGFloat()
    
    var widthBorder = CGFloat()
    var heightBorder = CGFloat()
    
    var carWidth = CGFloat()
    var carHeight = CGFloat()
    
    var carX = CGFloat()
    var carY = CGFloat()
    
    var stripesOriginY = CGFloat()
    
    // MARK: - ViewController Lyfecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        title = "Game"
        
        setupStripes()
        stripesAnimate()
        
        setupBorders()
        
        setupCarView()
        
        moveAnotherCar()
                
        setupBarView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: - Functions
    
    /// Crach notification
    func alertCrash() {
        
        let alertBtn: UIAlertController = UIAlertController(
            title: "GAME OVER",
            message: "Crash",
            preferredStyle: .alert)
        
        alertBtn.addAction(UIAlertAction(
            title: "Quit",
            style: .default) {_ in
                self.navigationController?.popToRootViewController(animated: true)
            }
        )
        
        alertBtn.addAction(UIAlertAction(
            title: "New Game",
            style: .default) {_ in
                self.moveAnotherCar()
                self.setupBarView()
            }
        )

        self.present(alertBtn, animated: true)
    }
    
    /// Create another car with motion animation based on random X coordinates and check for a crash with a car
    func moveAnotherCar() {
        
        view.addSubview(anotherCarImageView)
        
        // Parameters another car
        anotherCarImageView.center.x = CGFloat(Int.random(in: Int(widthBorder + (carWidth / 2))...Int(view.bounds.maxX - widthBorder - (carWidth / 2))))
        anotherCarImageView.center.y = 0
        anotherCarImageView.bounds = CGRect(x: 0, y: 0, width: carWidth, height: carHeight)
        anotherCarImageView.image = UIImage(named: "car2")
        
        // Motion animation with crash check
        UIView.animate(
            
            withDuration: 2.5,
            delay: 0,
            options: .curveLinear
        ) {
            
            self.anotherCarImageView.frame.origin.y = self.carImageView.frame.origin.y - (self.carHeight / 1.5)
        } completion: { _ in
            
            // Collision check and notification
            if self.carImageView.frame.intersects(self.anotherCarImageView.frame) {
                
                self.alertCrash()
            } else {
                
                UIView.animate(
                    withDuration: 1.2,
                    delay: 0,
                    options: .curveLinear
                ) {
                    self.anotherCarImageView.frame.origin.y = self.view.frame.maxY
                } completion: { _ in
                    self.moveAnotherCar()
                    self.setupBarView()
                }
            }
        }
    }
    
    /// Moving the car using swipes
    func moveCarGesture() {
        
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
    
    /// Parameters BarView
    func setupBarView() {
        
        barView.backgroundColor = .white
        barView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 10)
        
        view.addSubview(barView)
    }
    
    /// Parameters borders
    func setupBorders() {
        
        borderLeftView.backgroundColor = .green.withAlphaComponent(0.5)
        borderRightView.backgroundColor = .green.withAlphaComponent(0.5)
        
        widthBorder = view.bounds.width / 6
        heightBorder = view.bounds.height
        
        borderLeftView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: widthBorder, height: heightBorder)
        borderRightView.frame = CGRect(x: view.frame.maxX - widthBorder, y: view.frame.minY, width: widthBorder, height: heightBorder)
        
        view.addSubview(borderRightView)
        view.addSubview(borderLeftView)
    }
    
    /// Parameters car view
    func setupCarView() {
        
        carWidth = view.bounds.width / 4
        carHeight = carWidth + 50
        
        carX = view.center.x + 20
        carY = view.frame.maxY - (carHeight + 50)
        
        carImageView.frame = CGRect(x: carX, y: carY, width: carWidth, height: carHeight)
        carImageView.image = UIImage(named: "car")
        carImageView.contentMode = .scaleToFill
        
        view.addSubview(carImageView)
        
        moveCarGesture()
    }
    
    /// Animation of stripes movement
    func stripesAnimate() {
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveLinear
        ) {
            self.stripesOriginY = self.stripesStackView.frame.origin.y
            self.stripesStackView.frame.origin.y = 200
        } completion: { _ in
            self.stripesStackView.frame.origin.y = self.stripesOriginY
            self.stripesAnimate()
        }
    }
    
    /// Stripes parameters
    func setupStripes() {
        
        stripeWidth = view.bounds.width / 30
        stripeHeight = view.bounds.height / 7
        
        stripesStackView.translatesAutoresizingMaskIntoConstraints = false
        stripesStackView.axis = .vertical
        stripesStackView.alignment = .center
        stripesStackView.spacing = 100
        
        view.addSubview(stripesStackView)
        
        NSLayoutConstraint.activate([
            stripesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stripesStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: -100)
        ])
        
        for _ in 1...7 {
            let stripe = UIView()
            stripe.backgroundColor = .white
            stripe.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stripe.widthAnchor.constraint(equalToConstant: stripeWidth),
                stripe.heightAnchor.constraint(equalToConstant: stripeHeight)
            ])
            
            stripesStackView.addArrangedSubview(stripe)
        }
    }
    
    // MARK: - Selectors
    
    @objc func carMoveLeft() {
    
        if carImageView.frame.intersects(borderLeftView.frame) {
            alertCrash()
            print(1)
        } else {

            carX -= carStep

            carImageView.frame = CGRect(x: carX, y: carY, width: carWidth, height: carHeight)

            print(2)
        }
    
    }
    
    @objc func carMoveRight() {
        
        if carImageView.frame.intersects(borderRightView.frame) {
            alertCrash()
            print(3)
        } else {

            carX += carStep

            carImageView.frame = CGRect(x: carX, y: carY, width: carWidth, height: carHeight)

            print(4)
        }
    }
}
