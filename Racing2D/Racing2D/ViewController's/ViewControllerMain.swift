//
//  ViewControllerMain.swift
//  Racing2D
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

private enum Buttons {
    case game, scores, settings
}

final class ViewControllerMain: UIViewController {
    
    // MARK: - UIStackViews
    
    private let buttonsStack = UIStackView()
    
    // MARK: - UIButtons
    
    private let gameButton = UIButton()
    private let scoresButton = UIButton()
    private let settingsButton = UIButton()
    
    // MARK: - Struct objects
    
    private let const = Constants()
    
    // MARK: - View lifycicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearanceView()
        
        embedViews()
        
        setupLayoutButtonsStack()
        setupLayoutButton(gameButton)
        setupLayoutButton(scoresButton)
        setupLayoutButton(settingsButton)
        
        setupAppearanceButton(gameButton, .game)
        setupAppearanceButton(scoresButton, .scores)
        setupAppearanceButton(settingsButton, .settings)
        
        addActionToButton(gameButton, .game)
        addActionToButton(scoresButton, .scores)
        addActionToButton(settingsButton, .settings)
    }
    
    // MARK: - Selectors
    
    @objc
    private func goToGame() {
        let gameVC = ViewControllerGameMain()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc
    private func goToScores() {
        let scoresVC = ViewControllerScoresMain()
        navigationController?.pushViewController(scoresVC, animated: true)
    }
    
    @objc
    private func goToSettings() {
        let settingsVC = ViewControllerSettingsMain()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}

// MARK: - Embed Views

private extension ViewControllerMain {
    
    func embedViews() {
        view.addSubview(buttonsStack)
        
        buttonsStack.addArrangedSubview(gameButton)
        buttonsStack.addArrangedSubview(scoresButton)
        buttonsStack.addArrangedSubview(settingsButton)
    }
}

// MARK: - Setup Layout

private extension ViewControllerMain {
    
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
}

// MARK: - Setup Appearance

private extension ViewControllerMain {
    
    func setupAppearanceView() {
        view.backgroundColor = .red
        title = "Menu"
    }
    
    func setupAppearanceButton(_ button: UIButton, _ enumButton: Buttons) {
        button.backgroundColor = .white
        button.layer.cornerRadius = const.heightsButton / 2
        button.clipsToBounds = true
        button.setTitleColor(.black, for: .normal)
        button.addShadow(.black)
        
        switch enumButton {
        case .game:
            button.setTitle("Game", for: .normal)
        case .scores:
            button.setTitle("Scores", for: .normal)
        case .settings:
            button.setTitle("Settings", for: .normal)
        }
    }
}

// MARK: - Add Actions To Button

private extension ViewControllerMain {
    
    func addActionToButton(_ button: UIButton, _ enumButton: Buttons) {
        switch enumButton {
        case .game:
            button.addTarget(self, action: #selector(goToGame), for: .touchUpInside)
        case .scores:
            button.addTarget(self, action: #selector(goToScores), for: .touchUpInside)
        case .settings:
            button.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)
        }
    }
}

// MARK: - Constants

private extension ViewControllerMain {
    
    struct Constants {
        let widthButton: CGFloat = 150
        let heightsButton: CGFloat = 50
    }
}

