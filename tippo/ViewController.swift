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
    var firstLoad = true
    
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
        
        let tipPercentage = [0.1, 0.15, 0.2]
        let bill = Double(billText.text!) ?? 0
        let tip = bill * tipPercentage[tipSelection.selectedSegmentIndex]
        let total = bill + tip
        let currencyCode = UserDefaults.standard.string(forKey: "selectedCurrCode")
        
        if (currencyCode == nil || firstLoad) {
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
        else {
            let currencySymbol = getCurrencySymbol(currencyCode: currencyCode!)
            
            if let unwrapped = currencySymbol {
                tipLabel.text = String(format: "\(unwrapped)%.2f", tip)
                totalLabel.text = String(format: "\(unwrapped)%.2f", total)
            }
            else {
            }
        }
        animate()
    }
}

