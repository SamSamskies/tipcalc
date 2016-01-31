//
//  ViewController.swift
//  tipcalc
//
//  Created by Sam Samskies on 1/30/16.
//  Copyright © 2016 samsamskies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buildField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tipcalc"
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let billAmount = (buildField.text! as NSString).doubleValue
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

