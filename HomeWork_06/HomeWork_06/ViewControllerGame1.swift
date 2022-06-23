//
//  ViewControllerGame1.swift
//  HomeWork_06
//
//  Created by Борис Лустов on 21.06.22.
//

// Game1 for cats (random Circles)

import UIKit

// Method of creating a random color
extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0.0...1.0), green: .random(in: 0.0...1.0), blue: .random(in: 0.0...1.0), alpha: 1.0)
    }
}

class ViewControllerGame1: UIViewController {
    
    // Creating of buttons
    var arrayOfCircles: [UIButton] = [UIButton]()
    var createCircleBtn: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Setting the button parameters
        createCircleBtn.frame = view.bounds
        createCircleBtn.addTarget(self, action: #selector(createRandomCircle), for: .touchUpInside)
        
        view.addSubview(createCircleBtn)
    }
    
    ///  Deleting a random circle from View and array
    @objc func deleteCircle(_ sender: UIButton) {
        let index = arrayOfCircles.firstIndex(of: sender)
        guard index == nil else {
            arrayOfCircles.remove(at: index!)
            sender.removeFromSuperview()
            return
        }
    }
    
    /// Сreating a random circle with setting parameters
    @objc func createRandomCircle() {
        
        let newCircle: UIButton = UIButton()
        let circleWidth = 100
        let circleHeight = 100
        
        let fieldByWidth = Int(view.bounds.width) - circleWidth
        let fieldByHeight = Int(view.bounds.height) - circleHeight
        
        var tryCount = 0
        var circleAppended = false
        
        // Сreating a random circle by condition
        repeat {
            
            newCircle.frame = CGRect(x: Int.random(in: 0...fieldByWidth), y: Int.random(in: 0...fieldByHeight), width: circleWidth, height: circleHeight)
            newCircle.addTarget(self, action: #selector(deleteCircle), for: .touchUpInside)
            
            newCircle.backgroundColor = .randomColor()
            newCircle.layer.cornerRadius = newCircle.bounds.height / 2
            newCircle.clipsToBounds = true
            
            if arrayOfCircles.filter( {$0.frame.intersects(newCircle.frame)} ).isEmpty {
                arrayOfCircles.append(newCircle)
                view.addSubview(newCircle)
                circleAppended = true
            }
            tryCount += 1
            
        } while !circleAppended && (tryCount < 10000)
        
        // Тotification of the end of the place
        if !circleAppended {
            
            let alertBtn: UIAlertController = UIAlertController(title: "ALERT", message: "The place is over", preferredStyle: .alert)
            alertBtn.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alertBtn, animated: true)
        }
        
    }
    
}



