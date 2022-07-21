//
//  UIView+Shadow.swift
//  Racing2D
//
//  Created by Борис Лустов on 21.07.22.
//

import UIKit

public extension UIView {
    
    /// shadowOpacity = 0.7
    /// shadowRadius = 10
    func addShadow(_ color: UIColor) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 10
    }
}
