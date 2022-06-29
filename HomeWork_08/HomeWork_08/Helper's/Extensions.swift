//
//  Extensions.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

// Method of creating a random color
extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0.0...1.0), green: .random(in: 0.0...1.0), blue: .random(in: 0.0...1.0), alpha: 1.0)
    }
}
