//
//  EnterBodyInfoViewController.swift
//  HeartsUp
//
//  Created by Elijah Smith on 1/11/17.
//  Copyright © 2017 HeartsUp. All rights reserved.
//

import UIKit

class EnterBodyInfoViewController: UIViewController {

    //Define text fields
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bpmField: UITextField!
    @IBOutlet weak var mmhgField: UITextField!
    
    var textFields = [UITextField]() //Define the array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() //So that the user can click out of keyboard
        textFields = [ageField,heightField, weightField, bpmField, mmhgField] //Create an array to easier reference the fields
        for textField in textFields {
            textField.keyboardType = .numberPad //Force keyboard to be a number pad
        }
    }

    @IBAction func buttonNext(_ sender: Any) {
        let defaults = UserDefaults.standard //Easier access to Info.plist
        //print("Test")
        if bpmField.text == "" {
            defaults.set(85, forKey: "restingHR")
        }
        else {
            defaults.set(bpmField.text, forKey: "restingHR")
        }
        if mmhgField.text == "" {
            defaults.set(80, forKey: "restingBP")
        }
        else {
            defaults.set(mmhgField.text, forKey: "restingBP")
        }
        defaults.set(ageField.text, forKey: "age") //Set Text Field Value to Plist Variable
        print(defaults.string(forKey: "age")!) //Print Text Field Value to console to make sure it works
        defaults.set(heightField.text, forKey: "height")
        print(defaults.string(forKey: "height")!)
        defaults.set(weightField.text, forKey: "weight")
        print(defaults.string(forKey: "weight")!)
        print(defaults.string(forKey: "restingHR")!)
        print(defaults.string(forKey: "restingBP")!)

        let age = defaults.double(forKey: "age")
        let restingHR = defaults.double(forKey: "restingHR")
        let maxHR = 220 - age
        let hrr = maxHR - restingHR
        let rangemax = round(hrr * 0.6)
        let target = rangemax + restingHR
        let topHR = target
        let bottomHR = round(target * 0.4)
        
        defaults.set(topHR, forKey: "topHR")
        defaults.set(bottomHR, forKey: "bottomHR")
        print(defaults.string(forKey: "topHR")!)
        print(defaults.string(forKey: "bottomHR")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
