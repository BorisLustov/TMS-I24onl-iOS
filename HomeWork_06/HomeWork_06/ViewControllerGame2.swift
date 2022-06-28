//
//  ViewControllerGame2.swift
//  HomeWork_06
//
//  Created by Борис Лустов on 21.06.22.
//

// Game2 random Squares

import UIKit

class ViewControllerGame2: UIViewController {
    
    // Creating of button with parameters
    var newSquareBtn = UIButton()
    
    let widthBtn = 150
    let heightBtn = 50
    
    // Number of columns
    let columnsCount = 3
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        // Setting the button parameters

        let xBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yBtn = Int(view.bounds.height) - (heightBtn * 2)
        
        newSquareBtn.frame = CGRect(x: xBtn, y: yBtn, width: widthBtn, height: heightBtn)
        newSquareBtn.backgroundColor = .randomColor()
        newSquareBtn.layer.cornerRadius = newSquareBtn.bounds.height / 2
        newSquareBtn.clipsToBounds = true
        newSquareBtn.addTarget(self, action: #selector(createFieldSquares), for: .touchUpInside)
        newSquareBtn.setTitle("New Squares", for: .normal)
        
        view.addSubview(newSquareBtn)
        
    }
    /// Filling the field with squares
    @objc func createFieldSquares() {
        
        let widthSquare = Int(view.bounds.width) / columnsCount
        let heightSquare = widthSquare
        
        let rowsCount = Int((Int(view.bounds.height) - heightBtn) / heightSquare)
        
        var xSquare = 0
        var ySquare = 0
        
        for _ in 1...(columnsCount * rowsCount) {
            
            let newSquare = UIView()
            let squareLable = UILabel()
            
            let randomColorAndText = SquareColor.allCases.randomElement()!.randomColorAndText()
            
            newSquare.frame = CGRect(x: xSquare, y: ySquare, width: widthSquare, height: heightSquare)
            newSquare.backgroundColor = randomColorAndText.backgroundColor
            
            xSquare += widthSquare
            
            if xSquare >= Int(view.bounds.width) {
                xSquare = 0
                ySquare += heightSquare
            }
            
            view.addSubview(newSquare)
            
            squareLable.frame = newSquare.bounds
            squareLable.text = randomColorAndText.text
            squareLable.textAlignment = .center
            
            newSquare.addSubview(squareLable)
        }
        
    }
    
}
