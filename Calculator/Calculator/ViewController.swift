//
//  ViewController.swift
//  Calculator
//
//  Created by Борис Лустов on 11.07.22.
//

import UIKit

enum TypeOfButton {
    case numbers, calculating, operating
}

class ViewController: UIViewController {
    
    // MARK: - UIStackView
    
    private let allStackButton = UIStackView()
    
    private let firstStackButton = UIStackView()
    private let secondStackButton = UIStackView()
    private let thirdStackButton = UIStackView()
    private let fourStackButton = UIStackView()
    private let fifthStackButton = UIStackView()
    
    private let number0 = UIButton()
    let number1 = UIButton()
    let number2 = UIButton()
    let number3 = UIButton()
    let number4 = UIButton()
    let number5 = UIButton()
    let number6 = UIButton()
    let number7 = UIButton()
    let number8 = UIButton()
    let number9 = UIButton()
    let dot = UIButton()
    
    let AC = UIButton()
    let plusOrMinus = UIButton()
    let persent = UIButton()
    
    let division = UIButton()
    let multiplication = UIButton()
    let subtraction = UIButton()
    let addition = UIButton()
    let equally = UIButton()
    
    // MARK: - Struct objects
    
    private var variable = Variables()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupAllStackButton()
        
        setupStackButton(fifthStackButton)
        setupStackButton(fourStackButton)
        setupStackButton(thirdStackButton)
        setupStackButton(secondStackButton)
        setupStackButton(firstStackButton)
        
        setupButton(number0, "0", .numbers, firstStackButton)
        setupButton(dot, ",", .numbers, firstStackButton)
        setupButton(equally, "=", .calculating, firstStackButton)
        
        setupButton(number1, "1", .numbers, secondStackButton)
        setupButton(number2, "2", .numbers, secondStackButton)
        setupButton(number3, "3", .numbers, secondStackButton)
        setupButton(addition, "+", .calculating, secondStackButton)
        
        setupButton(number4, "4", .numbers, thirdStackButton)
        setupButton(number5, "5", .numbers, thirdStackButton)
        setupButton(number6, "6", .numbers, thirdStackButton)
        setupButton(subtraction, "-", .calculating, thirdStackButton)
        
        setupButton(number7, "7", .numbers, fourStackButton)
        setupButton(number8, "8", .numbers, fourStackButton)
        setupButton(number9, "9", .numbers, fourStackButton)
        setupButton(multiplication, "*", .calculating, fourStackButton)
        
        setupButton(AC, "AC", .operating, fifthStackButton)
        setupButton(plusOrMinus, "+/-", .operating, fifthStackButton)
        setupButton(persent, "%", .operating, fifthStackButton)
        setupButton(division, "/", .calculating, fifthStackButton)
        
    }
    
    private func setupAllStackButton() {
        allStackButton.translatesAutoresizingMaskIntoConstraints = false
        allStackButton.axis = .vertical
        allStackButton.alignment = .center
        allStackButton.spacing = 10
        
        view.addSubview(allStackButton)
        
        NSLayoutConstraint.activate([
            allStackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    private func setupStackButton(_ stack: UIStackView) {
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        
        allStackButton.addArrangedSubview(stack)
    }
    
    private func setupButton(_ button: UIButton, _ text: String, _ typeButton: TypeOfButton, _ stack: UIStackView) {
        
        variable.width = view.bounds.width / 4.5
        variable.height = variable.width
        variable.widthZero = (variable.width * 2) + 10
        
        switch typeButton {
        case .numbers:
            button.backgroundColor = .darkGray
        case .calculating:
            button.backgroundColor = .orange
        case .operating:
            button.backgroundColor = .lightGray
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch button {
        case number0:
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: variable.widthZero),
                button.heightAnchor.constraint(equalToConstant: variable.height)
            ])
            button.bounds = CGRect(x: 0, y: 0, width: variable.widthZero, height: variable.height)
        default:
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: variable.width),
                button.heightAnchor.constraint(equalToConstant: variable.height)
            ])
            button.bounds = CGRect(x: 0, y: 0, width: variable.width, height: variable.height)
        }
                
        button.layer.cornerRadius = button.bounds.height / 2
        button.clipsToBounds = true
        
        switch stack {
        case firstStackButton:
            firstStackButton.addArrangedSubview(button)
        case secondStackButton:
            secondStackButton.addArrangedSubview(button)
        case thirdStackButton:
            thirdStackButton.addArrangedSubview(button)
        case fourStackButton:
            fourStackButton.addArrangedSubview(button)
        case fifthStackButton:
            fifthStackButton.addArrangedSubview(button)
        default:
            break
        }
        
        let lable = UILabel()
        lable.frame = button.bounds
        lable.text = text
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 40)
        
        switch typeButton {
        case .operating:
            lable.textColor = .black
        default:
            lable.textColor = .white
        }
        
        button.addSubview(lable)
    }
}

extension ViewController {
    
    private struct Variables {
        
        var height = CGFloat()
        var width = CGFloat()
        var widthZero = CGFloat()
    }
}

