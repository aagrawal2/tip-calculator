//
//  SettingsViewController.swift
//  tippo
//
//  Created by Agrawal, Ankur on 3/11/17.
//  Copyright © 2017 Agrawal, Ankur. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var defaultTipPerc = Float(0.15)
    var selectedCurrCode = "USD"
    var currencyCodes = ["USD","GBP","EUR","CAD","AUD","INR","SGD","CHF","JPY"]
    
    @IBOutlet weak var defaultTipPercLabel: UILabel!
    @IBOutlet weak var defaultTipPercSlider: UISlider!
    @IBOutlet weak var tipDefaultSelection: UISegmentedControl!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "defaultTipPerc") == nil
        {
            defaultTipPercSlider.value = defaultTipPerc
            UserDefaults.standard.register(defaults: ["defaultTipPerc" : defaultTipPerc])
            UserDefaults.standard.register(defaults: ["selectedCurrCode": selectedCurrCode])
        }
        else {
            defaultTipPerc = UserDefaults.standard.float(forKey: "defaultTipPerc")
            defaultTipPercSlider.value = defaultTipPerc
        }
        /*
        let defaultTipPercStr = String(format: "%.2f", defaultTipPerc * 100)
        defaultTipPercLabel.text = "Default Tip Percentage \(defaultTipPercStr)%:"
        */
        setDefaultTip(self)
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.set(defaultTipPerc, forKey: "defaultTipPerc")
        UserDefaults.standard.set(selectedCurrCode, forKey: "selectedCurrCode")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func setDefaultTip(_ sender: AnyObject) {
        defaultTipPerc = defaultTipPercSlider.value
        let defaultTipPercStr = String(format: "%.2f", defaultTipPerc * 100)
        defaultTipPercLabel.text = "Default Tip Percentage \(defaultTipPercStr) %:"
    }
    
    //MARK: Data Sources
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return currencyCodes.count
        }
    
    //MARK: Delegates
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return currencyCodes[row]
        }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedCurrCode = currencyCodes[row]
        }

}
