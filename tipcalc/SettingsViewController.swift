//
//  SettingsViewController.swift
//  tipcalc
//
//  Created by Sam Samskies on 1/31/16.
//  Copyright © 2016 samsamskies. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipControl.selectedSegmentIndex = Storage.getPercentageChoice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onDefaultChanged(sender: UISegmentedControl) {
        let defaultPercentageChoice = sender.selectedSegmentIndex
        
        Storage.savePercentageChoice(defaultPercentageChoice)
    }

}
