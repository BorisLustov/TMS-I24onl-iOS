//
//  ViewControllerFiveStrb5.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerFiveStrb5: UIViewController {
    
    @IBOutlet weak var textLable: UILabel!
    
    private var finalText = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
        
        textLable.text = finalText
        
    }
    
    public func finalSet(text: String) {
        finalText = text
    }
    
}
