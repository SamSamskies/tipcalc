//
//  Defaults.swift
//  tipcalc
//
//  Created by Sam Samskies on 2/1/16.
//  Copyright © 2016 samsamskies. All rights reserved.
//

import Foundation

class Defaults {
    
    static let storage = NSUserDefaults.standardUserDefaults()
    static let defaultPercentageKey = "default_percentage"
    
    class func getPercentageChoice() -> Int {
        return storage.integerForKey(defaultPercentageKey)
    }
    
    class func savePercentageChoice(defaultPercentageChoice: Int) {
        storage.setInteger(defaultPercentageChoice, forKey: defaultPercentageKey)
    }
}
