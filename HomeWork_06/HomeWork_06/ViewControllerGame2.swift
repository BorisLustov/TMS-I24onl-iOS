//
//  ViewControllerGame2.swift
//  HomeWork_06
//
//  Created by Борис Лустов on 21.06.22.
//

import UIKit

class ViewControllerGame2: UIViewController {
    
    // creating of button
    var newSquareBtn: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Setting the button parameters
        let widghBtn = 150
        let heightBtn = 50
        let xBtn = (Int(view.bounds.width) / 2) - (widghBtn / 2)
        let yBtn = Int(view.bounds.height) - (heightBtn * 2)
        
        newSquareBtn.frame = CGRect(x: xBtn, y: yBtn, width: widghBtn, height: heightBtn)
        newSquareBtn.backgroundColor = .randomColor()
        newSquareBtn.layer.cornerRadius = newSquareBtn.bounds.height / 2
        newSquareBtn.clipsToBounds = true
        newSquareBtn.addTarget(self, action: #selector(createFieldSquares), for: .touchUpInside)
        newSquareBtn.setTitle("New Squares", for: .normal)
        
        view.addSubview(newSquareBtn)
        
    }
    /// Filling the field with squares
    @objc func createFieldSquares() {
        
        let columnsCount = 3
        
        let widthSquare = Int(view.bounds.width) / columnsCount
        let heightSquare = widthSquare
        
        let rowsCount = Int((Int(view.bounds.height) - 50) / heightSquare)
        
        var x = 0
        var y = 0
        
        for _ in 1...(columnsCount * rowsCount) {
            
            let newSquare: UIView = UIView()
            newSquare.frame = CGRect(x: x, y: y, width: widthSquare, height: heightSquare)
            newSquare.backgroundColor = .randomColor()
            x += widthSquare
            
            if x >= Int(view.bounds.width) {
                x = 0
                y += heightSquare
            }
            view.addSubview(newSquare)
        }
        
    }
    
}
