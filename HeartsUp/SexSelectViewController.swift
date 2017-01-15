//
//  SexSelectViewController.swift
//  HeartsUp
//
//  Created by Elijah Smith on 1/11/17.
//  Copyright © 2017 HeartsUp. All rights reserved.
//

import UIKit

class SexSelectViewController: UIViewController {

    let defaults = UserDefaults.standard //Easier access to Info.plist
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func segSex(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 { //Check for Female Selection
            defaults.set(false, forKey: "isMale") //Set isMale boolean to false
            print(defaults.string(forKey: "isMale")!) //Print isMale
            defaults.set("Female", forKey: "sex") //Set value for Preferences display
            print(defaults.string(forKey: "sex")!) //Print sex
        }
        else { //Defaults to Male Selection
            defaults.set(true, forKey: "isMale") //Set isMale boolean to true
            print(defaults.string(forKey: "isMale")!)
            defaults.set("Male", forKey: "sex")
            print(defaults.string(forKey: "sex")!)
        }
    }
    
    @IBAction func setupDoneButton(_ sender: Any) {
        defaults.set(true, forKey: "firstTimeOpened") //Make it so that the first time setup does not run again
        print(defaults.string(forKey: "firstTimeOpened")!) //Print firstTimeOpened to make sure it was set correctly
        
        /*//Here are the calculations for the tolerable HR range
        let age = defaults.double(forKey: "age")
        let restingHR = defaults.double(forKey: "restingHR")
        let maxHR = 220 - age
        let hrr = maxHR - restingHR
        let topHR = hrr
        let bottomHR = round(hrr * 0.2)
        
        defaults.set(topHR, forKey: "topHR")
        defaults.set(bottomHR, forKey: "bottomHR")
        print(defaults.string(forKey: "bottomHR")!)*/
        super.viewDidLoad()
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
