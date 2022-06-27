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
    
    /// Random color for the view and text of this color for the label
    func randomColorAndText(view: UIView, lable: UILabel) -> (UIView, UILabel){
        let view = UIView()
        let lable = UILabel()
        let a = SquareColor.allCases.randomElement()
        switch a {
        case .none:
            view.backgroundColor = .randomColor()
            lable.text = "Some color"
        case .some(.blue):
            view.backgroundColor = .blue
            lable.text = "Blue"
        case .some(.gray):
            view.backgroundColor = .gray
            lable.text = "Gray"
        case .some(.brown):
            view.backgroundColor = .brown
            lable.text = "Brown"
        case .some(.cyan):
            view.backgroundColor = .cyan
            lable.text = "Cyan"
        case .some(.green):
            view.backgroundColor = .green
            lable.text = "Green"
        case .some(.magenta):
            view.backgroundColor = .magenta
            lable.text = "Magenta"
        case .some(.orange):
            view.backgroundColor = .orange
            lable.text = "Orange"
        case .some(.red):
            view.backgroundColor = .red
            lable.text = "Red"
        }
        return (view, lable)
    }
}

