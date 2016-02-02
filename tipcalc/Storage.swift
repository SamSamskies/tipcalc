//
//  Storage.swift
//  tipcalc
//
//  Created by Sam Samskies on 2/1/16.
//  Copyright © 2016 samsamskies. All rights reserved.
//

import Foundation

class Storage {
    
    static let storage = NSUserDefaults.standardUserDefaults()
    static let lastAppStartDateKey = "last_app_start_date"
    static let billAmountKey = "bill_amount"
    static let defaultPercentageKey = "default_percentage"
    
    class func getBillAmount() -> String {
        return storage.objectForKey(billAmountKey) as! String
    }
    
    class func saveBillAmount(billAmount: String) {
        storage.setObject(billAmount, forKey: billAmountKey)
    }
    
    class func saveNewLastAppStartDate() {
        storage.setObject(NSDate(), forKey: lastAppStartDateKey)
    }
    
    class func getPercentageChoice() -> Int {
        return storage.integerForKey(defaultPercentageKey)
    }
    
    class func savePercentageChoice(defaultPercentageChoice: Int) {
        storage.setInteger(defaultPercentageChoice, forKey: defaultPercentageKey)
    }
    
    class func getMinutesSinceLastAppStart() -> Int {
        let storage = NSUserDefaults.standardUserDefaults()
        
        if let lastAppStartDate = storage.objectForKey(lastAppStartDateKey) {
            return NSCalendar.currentCalendar()
                .components(.Minute, fromDate: lastAppStartDate as! NSDate, toDate: NSDate(), options: [])
                .minute
            
        }
        
        return 0
    }
}