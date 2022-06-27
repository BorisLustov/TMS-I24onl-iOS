//
//  Beer.swift
//  BeerBar
//
//  Created by Борис Лустов on 27.06.22.
//

import UIKit

// class of beer bottle
class Beer {
    let name: String
    let price: Int
    let country: String
    var remainVolume: Double
    
    init(name: String, price: Int, country: String, remainVolume: Double) {
        self.name = name
        self.price = price
        self.country = country
        self.remainVolume = remainVolume
    }
    
}
