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
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bpmField: UITextField!
    
    var textFields = [UITextField]() //Define the array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() //So that the user can click out of keyboard
        textFields = [heightField, weightField, bpmField] //Create an array to easier reference the fields
        for textField in textFields {
            textField.keyboardType = .numberPad //Force keyboard to be a number pad
        }
    }

    @IBAction func buttonNext(_ sender: Any) {
        let defaults = UserDefaults.standard //Easier access to Info.plist
        //print("Test")
        defaults.set(heightField.text, forKey: "height") //Set Text Field Value to Plist variable
        print(defaults.string(forKey: "height")!) //Print Text Field Value to console to make sure it works
        defaults.set(weightField.text, forKey: "weight")
        print(defaults.string(forKey: "weight")!)
        defaults.set(bpmField.text, forKey: "restingHR")
        print(defaults.string(forKey: "restingHR")!)
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
