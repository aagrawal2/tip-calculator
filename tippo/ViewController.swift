//
//  ViewController.swift
//  tippo
//
//  Created by Agrawal, Ankur on 3/10/17.
//  Copyright © 2017 Agrawal, Ankur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelection: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var billAmount = 0.0
        
        if UserDefaults.standard.object(forKey: "billAmount") == nil {
            UserDefaults.standard.register(defaults: ["billAmount" : billAmount])
            UserDefaults.standard.register(defaults: ["endTime" : CFAbsoluteTimeGetCurrent()])
        }
        else {
            billAmount = UserDefaults.standard.double(forKey: "billAmount")
            let timeDiffInSec = CFAbsoluteTimeGetCurrent() - UserDefaults.standard.double(forKey: "endTime")
            
            if timeDiffInSec > 600 {
                billAmount = 0.0
            }
        }
        billText.text = String(format: "$%.2f", billAmount)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaultIndex = UserDefaults.standard.integer(forKey: "defaultIndex")
        tipSelection.selectedSegmentIndex = defaultIndex
        tipCalculator(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        let billAmount = Double(billText.text!) ?? 0
        UserDefaults.standard.set(billAmount, forKey: "billAmount")
        UserDefaults.standard.set(CFAbsoluteTimeGetCurrent(), forKey: "endTime")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func resetBillDisplay(_ sender: Any) {
        billText.text = ""
    }
    
    @IBAction func tipCalculator(_ sender: AnyObject) {
        
        let tipPercentage = [0.1, 0.15, 0.2]
        let bill = Double(billText.text!) ?? 0
        let tip = bill * tipPercentage[tipSelection.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

