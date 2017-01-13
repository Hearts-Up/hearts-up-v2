//
//  MainViewController.swift
//  HeartsUp
//
//  Created by Elijah Smith on 1/11/17.
//  Copyright © 2017 HeartsUp. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var topHR: UILabel!
    @IBOutlet weak var bottomHR: UILabel!
    let defaults = UserDefaults.standard //Easier access to Info.plist
    
    let heartURL = URL(string: "http://www.heart.org/HEARTORG/Conditions/HeartAttack/Heart-Attack_UCM_001092_SubHomePage.jsp") //Set URL for "More Info" Button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topHR.text = defaults.string(forKey: "topHR")
        bottomHR.text = defaults.string(forKey: "bottomHR")
        // Do any additional setup after loading the view.
    }

    @IBAction func infoButton(_ sender: Any) {
        UIApplication.shared.open(heartURL!, options: [:], completionHandler: nil) //Open URL
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
