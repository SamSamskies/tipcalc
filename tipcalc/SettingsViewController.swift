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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
