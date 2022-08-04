//
//  ViewController.swift
//  HomeWork_15
//
//  Created by Борис Лустов on 4.08.22.
//

import UIKit

enum AlertType {
    case alert, alertWithPassword
}

final class ViewController: UIViewController {
    
    private let menuView = UIView()
    
    private let buttonsStack = UIStackView()
    private let lableStack = UIStackView()
    
    private let lableOne = UILabel()
    private let lableTwo = UILabel()
    private let lableThree = UILabel()
    
    private let alertButton = UIButton()
    private let alertPasswordButton = UIButton()
    
    private let burgerButton = UIButton()
    private let closeMenuButton = UIButton()
    
    private let const = Constants()
    
    private var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearanceView()
        
        embedViews()
        
        setupLayoutButtonsStack()
        setupLayoutButton(alertButton)
        setupLayoutButton(alertPasswordButton)
        setupLayoutBurgerButton()
        setupLayoutBurgerMenu()
        setupLayoutCloseMenuButton()
        setupLayoutLablesStack()
        
        setupAppearanceButton(alertButton, .alert)
        setupAppearanceButton(alertPasswordButton, .alertWithPassword)
        setupAppearanceBurgerButton()
        setupAppearanceBurgerMenu()
        setupAppearanceLable(lableOne, "- Settings")
        setupAppearanceLable(lableTwo, "- Parameters")
        setupAppearanceLable(lableThree, "- Appearance")
        
        addActionToButton(alertButton, .alert)
        addActionToButton(alertPasswordButton, .alertWithPassword)
        addActiounToBurgerMenuButton()
        addActionToCloseBurgerMenuButton()
        
    }
}

// MARK: - Embed Views

private extension ViewController {
    
    func embedViews() {
        view.addSubview(buttonsStack)
        view.addSubview(burgerButton)
        
        buttonsStack.addArrangedSubview(alertButton)
        buttonsStack.addArrangedSubview(alertPasswordButton)
        
        view.addSubview(menuView)
        
        menuView.addSubview(lableStack)
        lableStack.addArrangedSubview(lableOne)
        lableStack.addArrangedSubview(lableTwo)
        lableStack.addArrangedSubview(lableThree)
    }
}

// MARK: - Setup Layout

private extension ViewController {
    
    func setupLayoutLablesStack() {
        lableStack.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            lableStack.centerXAnchor.constraint(equalTo: menuView.centerXAnchor, constant: -30),
            lableStack.centerYAnchor.constraint(equalTo: menuView.centerYAnchor, constant: -200)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        lableStack.axis = .vertical
        lableStack.alignment = .leading
        lableStack.spacing = 35
    }
    
    func setupLayoutButtonsStack() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        buttonsStack.axis = .vertical
        buttonsStack.alignment = .center
        buttonsStack.spacing = 35
    }
    
    func setupLayoutButton(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            button.widthAnchor.constraint(equalToConstant: const.widthButton),
            button.heightAnchor.constraint(equalToConstant: const.heightsButton)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupLayoutBurgerButton() {
        burgerButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            burgerButton.widthAnchor.constraint(equalToConstant: 45),
            burgerButton.heightAnchor.constraint(equalToConstant: 40),
            burgerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            burgerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupLayoutBurgerMenu() {
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.6),
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        menuView.layer.zPosition = 1000
    }
    
    func setupLayoutCloseMenuButton() {
        closeMenuButton.frame = view.bounds
        closeMenuButton.layer.zPosition = 900
    }
}

// MARK: - Setup Appearance

private extension ViewController {
    
    func setupAppearanceView() {
        view.backgroundColor = .orange
    }
    
    func setupAppearanceLable(_ lable: UILabel, _ lableText: String) {
        lable.text = lableText
    }
    
    func setupAppearanceButton(_ button: UIButton, _ enumAlert: AlertType) {
        var text = String()
        
        button.backgroundColor = .white
        button.layer.cornerRadius = const.heightsButton / 2
        button.clipsToBounds = true
        button.setTitleColor(.black, for: .normal)
        
        switch enumAlert {
        case .alert:
            text = "Alert"
        case .alertWithPassword:
            text = "Password"
        }
        
        button.setTitle(text, for: .normal)
    }
    
    func setupAppearanceBurgerButton() {
        burgerButton.setImage(UIImage(named: "menu"), for: .normal)
    }
    
    func setupAppearanceBurgerMenu() {
        menuView.backgroundColor = .lightGray
    }
}

// MARK: - Actions for Buttons

private extension ViewController {
    
    func addActionToButton(_ button: UIButton, _ enumAlert: AlertType) {
        switch enumAlert {
        case .alert:
            button.addTarget(self, action: #selector(addAlert), for: .touchUpInside)
        case .alertWithPassword:
            button.addTarget(self, action: #selector(addAlertWithPassword), for: .touchUpInside)
        }
    }
    
    func addActiounToBurgerMenuButton() {
        burgerButton.addTarget(self, action: #selector(showBurgerMenu), for: .touchUpInside)
    }
    
    func addActionToCloseBurgerMenuButton() {
        closeMenuButton.addTarget(self, action: #selector(closeBurgerMenu), for: .touchUpInside)
    }
}

// MARK: - Alert Controllers

private extension ViewController {
    
    @objc func addAlert() {
        let alert = UIAlertController(
            title: "ALERT", message: "This is Alert Controller with one button, please press OK",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    @objc func addAlertWithPassword() {
        let alertWithPass = UIAlertController(
            title: "Alert with Pass",
            message: "This is Alert Controller with two buttons and field with password, please enter the password and press any button",
            
            preferredStyle: .alert
        )
        
        alertWithPass.addTextField { textField in
            textField.placeholder = "Enter the password"
            textField.isSecureTextEntry = true
        }
        
        alertWithPass.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertWithPass.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertWithPass, animated: true)
    }
}

// MARK: - Menu Button Action

private extension ViewController {
    
    @objc func showBurgerMenu() {
        let menuAnimate = menuView.transform.translatedBy(x: menuView.bounds.width, y: 0)
        
        view.addBlurEffect(.dark)
        view.addSubview(closeMenuButton)
        
        UIView.animate(withDuration: 0.3) {
            self.menuView.transform = menuAnimate
        }
        
    }
    
    @objc func closeBurgerMenu() {
        let menuAnimate = menuView.transform.translatedBy(x: -menuView.bounds.width, y: 0)
        
        view.removeBlur()
        closeMenuButton.removeFromSuperview()
        
        UIView.animate(withDuration: 0.3) {
            self.menuView.transform = menuAnimate
        }
    }
}

// MARK: - Add Blur

private extension UIView {
    
    func addBlurEffect(_ style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(blurEffectView)
        blurEffectView.layer.zPosition = 500
    }
    
    func removeBlur() {
        for view in subviews {
            if view is UIVisualEffectView {
                view.removeFromSuperview()
            }
        }
    }
}

// MARK: - Constants

private extension ViewController {
    
    struct Constants {
        let widthButton: CGFloat = 150
        let heightsButton: CGFloat = 50
    }
}
