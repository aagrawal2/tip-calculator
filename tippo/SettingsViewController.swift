//
//  SettingsViewController.swift
//  tippo
//
//  Created by Agrawal, Ankur on 3/11/17.
//  Copyright © 2017 Agrawal, Ankur. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    var defaultIndex = 0
    var selectedCurrCode = "USD"
    @IBOutlet weak var tipDefaultSelection: UISegmentedControl!
    @IBOutlet weak var currencyPicker: UIPickerView!
    var currencyCodes = ["USD","GBP","EUR","CAD","AUD","INR","SGD","CHF","JPY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "defaultIndex") == nil {
            tipDefaultSelection.selectedSegmentIndex = defaultIndex
            UserDefaults.standard.register(defaults: ["defaultIndex" : defaultIndex])
            UserDefaults.standard.register(defaults: ["selectedCurrCode": selectedCurrCode])
        }
        else {
            defaultIndex = UserDefaults.standard.integer(forKey: "defaultIndex")
            tipDefaultSelection.selectedSegmentIndex = defaultIndex
        }
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.set(defaultIndex, forKey: "defaultIndex")
        UserDefaults.standard.set(selectedCurrCode, forKey: "selectedCurrCode")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func setDefaultTip(_ sender: AnyObject) {
        defaultIndex = tipDefaultSelection.selectedSegmentIndex
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
