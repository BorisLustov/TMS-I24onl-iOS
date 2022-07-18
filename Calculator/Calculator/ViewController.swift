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
    
    private let allStackView = UIStackView()
    
    private let firstStackButton = UIStackView()
    private let secondStackButton = UIStackView()
    private let thirdStackButton = UIStackView()
    private let fourStackButton = UIStackView()
    private let fifthStackButton = UIStackView()
    
    private let resultStackView = UIStackView()
    
    // MARK: - UIButton
    
    private let number0 = UIButton()
    private let number1 = UIButton()
    private let number2 = UIButton()
    private let number3 = UIButton()
    private let number4 = UIButton()
    private let number5 = UIButton()
    private let number6 = UIButton()
    private let number7 = UIButton()
    private let number8 = UIButton()
    private let number9 = UIButton()
    private let dot = UIButton()
    
    private let AC = UIButton()
    private let plusOrMinus = UIButton()
    private let persent = UIButton()
    
    private let division = UIButton()
    private let multiplication = UIButton()
    private let subtraction = UIButton()
    private let addition = UIButton()
    private let equally = UIButton()
    
    // MARK: - UILabel
    
    private let resultLabel = UILabel()
    
    // MARK: - Struct objects
    
    private var variable = Variables()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupAllStackView()
        
        setupResultStackView()
        setupStackView(fifthStackButton)
        setupStackView(fourStackButton)
        setupStackView(thirdStackButton)
        setupStackView(secondStackButton)
        setupStackView(firstStackButton)
        
        setupResultLable()
        
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
        
        AC.addTarget(self, action: #selector(ac), for: .touchUpInside)
        number1.addTarget(self, action: #selector(num1), for: .touchUpInside)
        
    }
    
    @objc
    private func ac() {
        resultLabel.text = "0"
    }
    
    @objc
    private func num1() {
        if resultLabel.text == "0" {
            resultLabel.text?.removeAll()
        }
        resultLabel.text?.append(contentsOf: "1")
        
    }
    
    private func setupAllStackView() {
        
        allStackView.translatesAutoresizingMaskIntoConstraints = false
        allStackView.axis = .vertical
        allStackView.alignment = .center
        allStackView.spacing = 10
        
        view.addSubview(allStackView)
        
        NSLayoutConstraint.activate([
            allStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func setupStackView(_ stack: UIStackView) {
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        
        allStackView.addArrangedSubview(stack)
    }
    
    private func setupResultStackView() {
        
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        resultStackView.axis = .horizontal
        resultStackView.alignment = .center
        
        allStackView.addArrangedSubview(resultStackView)
        
        NSLayoutConstraint.activate([
            resultStackView.leadingAnchor.constraint(equalTo: allStackView.leadingAnchor, constant: 20),
            resultStackView.trailingAnchor.constraint(equalTo: allStackView.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupButton(_ button: UIButton, _ text: String, _ typeButton: TypeOfButton, _ stack: UIStackView) {
        
        sizesOfButton()
        
        colorForButton(button, typeButton)
        
        setupAppearanceOfButton(button)

        addButtonToStackView(button, stack)
        
        lableForButton(button, text, typeButton)
    }
    
    private func sizesOfButton() {
        
        variable.width = view.bounds.width / 4.5
        variable.height = variable.width
        variable.widthZero = (variable.width * 2) + 10
    }
    
    private func colorForButton(_ button: UIButton, _ typeButton: TypeOfButton) {
        
        switch typeButton {
        case .numbers:
            button.backgroundColor = .darkGray
        case .calculating:
            button.backgroundColor = .orange
        case .operating:
            button.backgroundColor = .lightGray
        }
    }
    
    private func setupAppearanceOfButton(_ button: UIButton) {
        
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
    }
    
    private func addButtonToStackView(_ button: UIButton, _ stack: UIStackView) {
        
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
    }
    
    private func lableForButton(_ button: UIButton, _ text: String, _ typeButton: TypeOfButton) {
        
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
    
    private func setupResultLable() {
        
        resultLabel.frame = resultStackView.bounds
        resultLabel.text = "0"
        resultLabel.textAlignment = .right
        resultLabel.textColor = .white
        resultLabel.font = UIFont.systemFont(ofSize: 90, weight: .thin)
        resultStackView.addArrangedSubview(resultLabel)
    }
    
    
}

extension ViewController {
    
    private struct Variables {
        
        var height = CGFloat()
        var width = CGFloat()
        var widthZero = CGFloat()
    }
}

