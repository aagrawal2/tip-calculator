//
//  SettingsViewController.swift
//  tippo
//
//  Created by Agrawal, Ankur on 3/11/17.
//  Copyright © 2017 Agrawal, Ankur. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var defaultIndex = 0
    @IBOutlet weak var tipDefaultSelection: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "defaultIndex") == nil {
            tipDefaultSelection.selectedSegmentIndex = defaultIndex
            UserDefaults.standard.register(defaults: ["defaultIndex" : defaultIndex])
        }
        else {
            defaultIndex = UserDefaults.standard.integer(forKey: "defaultIndex")
            tipDefaultSelection.selectedSegmentIndex = defaultIndex
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.set(defaultIndex, forKey: "defaultIndex")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func setDefaultTip(_ sender: AnyObject) {
        defaultIndex = tipDefaultSelection.selectedSegmentIndex
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
