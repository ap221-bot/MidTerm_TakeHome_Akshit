//
//  Lab3ViewController.swift
//  Akshit_Patel_MT_8912820
//
//  Created by user232103 on 11/6/23.
//

import UIKit

class Lab3ViewController: UIViewController {

    //making necessary outlets
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var infoView: UITextView!
    @IBOutlet weak var invisibleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabelInvisible()
    }
    
    //MARK: handling click on add button
    
    @IBAction func addBtn(_ sender: Any) {
        
        //calculating values which is to be displayed
        let fullNamestr = String(firstName.text ?? "") + " " + (lastName.text ?? "")
        let countryStr = String(country.text ?? "")
        let ageStr = String(age.text ?? "")
        
        infoView.text = "Full Name: \(fullNamestr)\nCountry : \(countryStr)\nAge: \(ageStr)"
        makeLabelInvisible()
    }
    
    //MARK: function to make label visible
    
    @objc func makeLabelInvisible()
    {
        invisibleLabel.isHidden = true;
    }
    
    
    //MARK: function to handle click on submit button
    
    @IBAction func submitBtn(_ sender: Any) {
        
        invisibleLabel.isHidden = false
        
        //checking if everything is given by user or not
        if(String(firstName.text ?? "").count >= 1 && String(lastName.text ?? "").count >= 1 && String(age
            .text ?? "").count >= 1 && String(country.text ?? "").count >= 1)
        {
            invisibleLabel.text = "Successfully submitted!"
        }
        else
        {
            invisibleLabel.text = "Complete the missing Info!"
            
            //timer to make label invisible
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(makeLabelInvisible), userInfo: nil, repeats: false)
            
        }
    }
    
    //MARK: function to handle click on clear button
    
    @IBAction func clearBtn(_ sender: Any) {
        firstName.text = ""
        lastName.text = ""
        country.text = ""
        age.text = ""
        infoView.text = ""
        makeLabelInvisible()
    }

}
