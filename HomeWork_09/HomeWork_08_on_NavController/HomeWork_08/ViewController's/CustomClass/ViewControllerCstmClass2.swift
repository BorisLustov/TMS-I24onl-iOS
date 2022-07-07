//
//  ViewControllerCstmClass2.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerCstmClass2: UIViewController {
    
    @IBOutlet weak var carBrandLbl: UILabel!
    @IBOutlet weak var carModelLbl: UILabel!
    @IBOutlet weak var fuelTypeLbl: UILabel!
    
    private var carBrandText = ""
    private var carModelText = ""
    private var fuelTypeText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
        
        carBrandLbl.text = carBrandText
        carModelLbl.text = carModelText
        fuelTypeLbl.text = fuelTypeText
    }
    
    func getLablesText(obj: MyCustomClassCar) {
        carBrandText = obj.carBrand
        carModelText = obj.carModel
        fuelTypeText = obj.fuelType
    }
}
