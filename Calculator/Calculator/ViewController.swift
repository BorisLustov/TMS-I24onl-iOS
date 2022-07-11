//
//  ViewController.swift
//  Calculator
//
//  Created by Борис Лустов on 11.07.22.
//

import UIKit

let number0 = UIView()
let number1 = UIView()
let number2 = UIView()
let number3 = UIView()
let number4 = UIView()
let number5 = UIView()
let number6 = UIView()
let number7 = UIView()
let number8 = UIView()
let number9 = UIView()
let dot = UIView()

let AC = UIView()
let plusOrMinus = UIView()
let persent = UIView()

let division = UIView()
let multiplication = UIView()
let subtraction = UIView()
let addition = UIView()
let equally = UIView()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let height = view.bounds.width / 4
        let width = height
        let widthZero = height * 2
        
        viewParameters(view: number0, x: view.bounds.minX, y: view.bounds.maxY - (height * 2), width: widthZero, height: height, color: .darkGray, lableText: "0", lableColor: .white)
        viewParameters(view: number1, x: view.bounds.minX, y: view.bounds.maxY - (height * 3), width: width, height: height, color: .darkGray, lableText: "1", lableColor: .white)
        viewParameters(view: number2, x: view.bounds.minX + width, y: view.bounds.maxY - (height * 3), width: width, height: height, color: .darkGray, lableText: "2", lableColor: .white)
        viewParameters(view: number3, x: view.bounds.minX + (width * 2), y: view.bounds.maxY - (height * 3), width: width, height: height, color: .darkGray, lableText: "3", lableColor: .white)
        viewParameters(view: number4, x: view.bounds.minX, y: view.bounds.maxY - (height * 4), width: width, height: height, color: .darkGray, lableText: "4", lableColor: .white)
        viewParameters(view: number5, x: view.bounds.minX + width, y: view.bounds.maxY - (height * 4), width: width, height: height, color: .darkGray, lableText: "5", lableColor: .white)
        viewParameters(view: number6, x: view.bounds.minX + (width * 2), y: view.bounds.maxY - (height * 4), width: width, height: height, color: .darkGray, lableText: "6", lableColor: .white)
        viewParameters(view: number7, x: view.bounds.minX, y: view.bounds.maxY - (height * 5), width: width, height: height, color: .darkGray, lableText: "7", lableColor: .white)
        viewParameters(view: number8, x: view.bounds.minX + width, y: view.bounds.maxY - (height * 5), width: width, height: height, color: .darkGray, lableText: "8", lableColor: .white)
        viewParameters(view: number9, x: view.bounds.minX + (width * 2), y: view.bounds.maxY - (height * 5), width: width, height: height, color: .darkGray, lableText: "9", lableColor: .white)
        viewParameters(view: dot, x: view.bounds.minX + (width * 2), y: view.bounds.maxY - (height * 2), width: width, height: height, color: .darkGray, lableText: ",", lableColor: .white)
        
        viewParameters(view: AC, x: view.bounds.minX, y: view.bounds.maxY - (height * 6), width: width, height: height, color: .gray, lableText: "AC", lableColor: .black)
        viewParameters(view: plusOrMinus, x: view.bounds.minX + width, y: view.bounds.maxY - (height * 6), width: width, height: height, color: .gray, lableText: "+/-", lableColor: .black)
        viewParameters(view: persent, x: view.bounds.minX + (width * 2), y: view.bounds.maxY - (height * 6), width: width, height: height, color: .gray, lableText: "%", lableColor: .black)
        
        viewParameters(view: division, x: view.bounds.minX + (width * 3), y: view.bounds.maxY - (height * 6), width: width, height: height, color: .orange, lableText: "/", lableColor: .white)
        viewParameters(view: multiplication, x: view.bounds.minX + (width * 3), y: view.bounds.maxY - (height * 5), width: width, height: height, color: .orange, lableText: "*", lableColor: .white)
        viewParameters(view: subtraction, x: view.bounds.minX + (width * 3), y: view.bounds.maxY - (height * 4), width: width, height: height, color: .orange, lableText: "-", lableColor: .white)
        viewParameters(view: addition, x: view.bounds.minX + (width * 3), y: view.bounds.maxY - (height * 3), width: width, height: height, color: .orange, lableText: "+", lableColor: .white)
        viewParameters(view: equally, x: view.bounds.minX + (width * 3), y: view.bounds.maxY - (height * 2), width: width, height: height, color: .orange, lableText: "=", lableColor: .white)
    }
    
    func viewParameters(view: UIView, x: Double, y: Double, width: Double, height: Double, color: UIColor, lableText: String, lableColor: UIColor) {
        view.frame = CGRect(x: x, y: y, width: width, height: height)
        view.backgroundColor = color
        view.layer.cornerRadius = view.bounds.height / 2
        self.view.addSubview(view)
        
        let lable = UILabel()
        lable.frame = view.bounds
        lable.text = lableText
        lable.textColor = lableColor
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(lable)
        
        
    }
    
}

