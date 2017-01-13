//
//  EnterContactsViewController.swift
//  HeartsUp
//
//  Created by Elijah Smith on 1/11/17.
//  Copyright © 2017 HeartsUp. All rights reserved.
//

import UIKit

class EnterContactsViewController: UIViewController {

    //Define Text Fields
    @IBOutlet weak var firstContactField: UITextField!
    @IBOutlet weak var secondContactField: UITextField!
    @IBOutlet weak var thirdContactField: UITextField!
    
    var contactFields = [UITextField]() //Define the array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() //Call function defined at the bottom of this file
        contactFields = [firstContactField, secondContactField, thirdContactField] //Create an array to easier reference the fields
        for contactField in contactFields {
            contactField.keyboardType = .numberPad //Force keyboard to be a number pad
        }
    }
    
    @IBAction func okPressed(_ sender: Any) {
        let defaults = UserDefaults.standard //Easier access to Info.plist
        defaults.set(firstContactField.text, forKey: "firstEmergencyContact") //Set Text Field Value to Plist variable
        print(defaults.string(forKey: "firstEmergencyContact")!) //Print Text Field Value to console to make sure it works
        defaults.set(secondContactField.text, forKey: "secondEmergencyContact")
        print(defaults.string(forKey: "secondEmergencyContact")!)
        defaults.set(thirdContactField.text, forKey: "thirdEmergencyContact")
        print(defaults.string(forKey: "thirdEmergencyContact")!)
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

//This whole thing here makes it so that the user can actually tap out of the keyboard and dismiss it
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EnterContactsViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
