//
//  profileViewController.swift
//  Safe App
//
//  Created by Ebou Jobe on 2017-01-21.
//  Copyright © 2017 Ebou Jobe. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    @IBOutlet var textFiledName: UITextField!
    @IBOutlet var textFiledYear: UITextField!
    @IBOutlet var textFiledDay: UITextField!
    @IBOutlet var textFiledWeight: UITextField!
    @IBOutlet var textFieldHeight: UITextField!
    @IBOutlet var textFiledGender: UITextField!
    @IBOutlet var textFiledMonth: UITextField!
    
      var someVariable: String = ""
    
   
    @IBAction func Save(_ sender: Any) {
        
        let name = textFiledName.text!
        let year = textFiledYear.text!
        let day = textFiledDay.text!
        let month = textFiledMonth.text!
        let gender = textFiledGender.text!
        let weight = textFiledWeight.text!
        let height = textFieldHeight.text!
        
        someVariable = "\nName: " + name + "\nBirthdate: " + year + "/" + month + "/" + day + "\nGender: " + gender + "\nHeight: " + height + " cm\nWeight: " + weight + " kg"
        GlobalVariable.tempMessage.append(someVariable)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    struct GlobalVariable {
    
    static var tempMessage = String()
    
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
