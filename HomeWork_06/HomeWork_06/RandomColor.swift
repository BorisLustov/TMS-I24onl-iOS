//
//  RandomColor.swift
//  HomeWork_06
//
//  Created by Борис Лустов on 27.06.22.
//

import UIKit

// Method of creating a random color
extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0.0...1.0), green: .random(in: 0.0...1.0), blue: .random(in: 0.0...1.0), alpha: 1.0)
    }
}

// Enumeration for colors square
enum SquareColor: CaseIterable {
    case red
    case blue
    case gray
    case brown
    case cyan
    case green
    case magenta
    case orange
    case yellow
    case purple
    
    /// Random color for the view and text of this color for the label
    func randomColorAndText() -> UILabel{
        let colorAndText = UILabel()
        let i = SquareColor.allCases.randomElement()
        switch i {
        case .none:
            colorAndText.backgroundColor = .randomColor()
            colorAndText.text = "Some color"
        case .some(.blue):
            colorAndText.backgroundColor = .blue
            colorAndText.text = "Blue"
        case .some(.gray):
            colorAndText.backgroundColor = .gray
            colorAndText.text = "Gray"
        case .some(.brown):
            colorAndText.backgroundColor = .brown
            colorAndText.text = "Brown"
        case .some(.cyan):
            colorAndText.backgroundColor = .cyan
            colorAndText.text = "Cyan"
        case .some(.green):
            colorAndText.backgroundColor = .green
            colorAndText.text = "Green"
        case .some(.magenta):
            colorAndText.backgroundColor = .magenta
            colorAndText.text = "Magenta"
        case .some(.orange):
            colorAndText.backgroundColor = .orange
            colorAndText.text = "Orange"
        case .some(.red):
            colorAndText.backgroundColor = .red
            colorAndText.text = "Red"
        case .some(.yellow):
            colorAndText.backgroundColor = .yellow
            colorAndText.text = "Yellow"
        case .some(.purple):
            colorAndText.backgroundColor = .purple
            colorAndText.text = "Purple"
        }
        return colorAndText
    }
}


