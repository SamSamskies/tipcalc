//
//  ViewController.swift
//  tipcalc
//
//  Created by Sam Samskies on 1/30/16.
//  Copyright © 2016 samsamskies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let storage = NSUserDefaults.standardUserDefaults()
    let lastAppStartDateKey = "last_app_start_date"
    let billAmountKey = "bill_amount"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tipcalc"
        
        tipControl.selectedSegmentIndex = Storage.getPercentageChoice()
        
        // If app used less than 10 minutes ago, set bill amount to bill amount
        // from previous app usage.
        if (Storage.getMinutesSinceLastAppStart() < 10) {
            billField.text = Storage.getBillAmount()
            updateTipAndTotalOutlets()
        } else {
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
        
        billField.becomeFirstResponder()
        
        Storage.saveNewLastAppStartDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTipAndTotalOutlets()
        Storage.saveBillAmount(billField.text!)
    }
    
    func updateTipAndTotalOutlets() {
        let billAmount = (billField.text! as NSString).doubleValue
        let tip = billAmount * getTipPercentage()
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func getTipPercentage() -> Double {
        let tipPercentages = [0.15, 0.18, 0.2]
        
        return tipPercentages[tipControl.selectedSegmentIndex]
    }

}

