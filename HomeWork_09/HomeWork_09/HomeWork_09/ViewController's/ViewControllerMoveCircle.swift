//
//  ViewControllerMoveCircle.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerMoveCircle: UIViewController {
    
    let circle = UIView()
    
    // Coordinates and parameters of circle
    var xCircle = 0
    var yCircle = 0
    let widthCircle = 100
    let heightCircle = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
                
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create circle with parameters
        xCircle = (Int(view.bounds.width) / 2) - (widthCircle / 2)
        yCircle = (Int(view.bounds.height) / 2) - (heightCircle / 2)
        
        circle.frame = CGRect(x: xCircle, y: yCircle, width: widthCircle, height: heightCircle)
        circle.backgroundColor = .randomColor()
        circle.clipsToBounds = true
        circle.layer.cornerRadius = circle.bounds.height / 2
        
        view.addSubview(circle)
        
    }


}
