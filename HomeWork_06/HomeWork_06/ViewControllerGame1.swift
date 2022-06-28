//
//  ViewControllerGame1.swift
//  HomeWork_06
//
//  Created by Борис Лустов on 21.06.22.
//

// Game1 for cats (random Circles)

import UIKit

class ViewControllerGame1: UIViewController {
    
    // Creating of buttons with parameters
    var arrayOfCircles = [UIButton]()
    var createCircleBtn = UIButton()
    
    let circleWidth = 100
    let circleHeight = 100
    
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
        
        let newCircle = UIButton()
        
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



