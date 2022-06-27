//
//  SellManager.swift
//  BeerBar
//
//  Created by Борис Лустов on 27.06.22.
//

import UIKit

// singleton manager class
class SellManager {
    static let shared = SellManager()
    var totalCash = 0
    var totalVolume = 0.0
    // function buying beer
    func buyIt(_ n: Beer) {
        totalCash += n.price
        totalVolume += 0.5
        n.remainVolume -= 0.5
    }
}
