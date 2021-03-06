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
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelection: UISegmentedControl!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    var firstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billText.becomeFirstResponder()
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
        let defaultTipPerc = UserDefaults.standard.float(forKey: "defaultTipPerc")
        tipPercentageSlider.value = defaultTipPerc
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
        //view.endEditing(true)
    }
    
    @IBAction func resetBillDisplay(_ sender: Any) {
        billText.text = ""
        if firstLoad {
            firstLoad = false
            UserDefaults.standard.set("USD", forKey: "selectedCurrCode")
        }
    }
    
    func getCurrencySymbol(currencyCode: String) -> String? {
        let locale = NSLocale(localeIdentifier: currencyCode)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: currencyCode)
    }
    
    func animate() -> Void {        
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        UIView.animate(withDuration: 0.1, animations: {
            self.tipLabel.backgroundColor = UIColor.lightGray
            self.totalLabel.backgroundColor = UIColor.lightGray
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
        })
    }
    
    @IBAction func tipCalculator(_ sender: AnyObject) {
        
        let tipPercentage = tipPercentageSlider.value
        let tipPercentageStr = String(format: "%.2f", tipPercentage * 100)
        tipPercentageLabel.text = "Tip \(tipPercentageStr) %:"
                
        let bill = Double(billText.text!) ?? 0
        let tip = bill * Double(tipPercentage)
        let total = bill + tip
        let currencyCode = UserDefaults.standard.string(forKey: "selectedCurrCode")
        
        if (currencyCode == nil || firstLoad) {
            tipLabel.text = String(format: "Tip: $%.2f", tip)
            totalLabel.text = String(format: "Total: $%.2f", total)
        }
        else {
            let currencySymbol = getCurrencySymbol(currencyCode: currencyCode!)
            
            if let unwrapped = currencySymbol {
                tipLabel.text = String(format: "Tip:  \(unwrapped)%.2f", tip)
                totalLabel.text = String(format: "Total: \(unwrapped)%.2f", total)
            }
            else {
            }
        }
        //animate()
    }
}

