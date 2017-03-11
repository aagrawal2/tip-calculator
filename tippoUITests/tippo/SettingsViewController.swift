//
//  SettingsViewController.swift
//  tippo
//
//  Created by Agrawal, Ankur on 3/11/17.
//  Copyright © 2017 Agrawal, Ankur. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipDefaultSelection: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func setDefaultTip(_ sender: AnyObject) {
        
        let percentage = [0.1, 0.15, 0.2]
        let defaultIndex = tipDefaultSelection.selectedSegmentIndex
        let defaultPerc = percentage[defaultIndex]
        
        UserDefaults.standard.register(defaults: ["defaultIndex" : defaultIndex])
        UserDefaults.standard.register(defaults: ["defaultTipPerc" : defaultPerc])
        
        UserDefaults.standard.set(defaultIndex, forKey: "defaultIndex")
        UserDefaults.standard.set(defaultPerc, forKey: "defaultTipPerc")
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
