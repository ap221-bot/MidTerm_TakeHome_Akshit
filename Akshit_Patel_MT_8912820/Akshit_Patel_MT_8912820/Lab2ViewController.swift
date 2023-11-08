//
//  Lab2ViewController.swift
//  Akshit_Patel_MT_8912820
//
//  Created by user232103 on 11/6/23.
//

import UIKit

class Lab2ViewController: UIViewController {

    //making outlet for outputlabel
    @IBOutlet weak var outputLabel: UILabel!
    var outputLabelValue = 0
    var incrementCount = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        assignValueInString()
    }
    
    //MARK: function to assign value from new calculated value to outputlabel
    
    func assignValueInString()
    {
        outputLabel.text = String(outputLabelValue)
    }
    
    //MARK: function to increment value by incrementCount
    
    @IBAction func plusSignFunction(_ sender: Any) {
        outputLabelValue += incrementCount
        assignValueInString()
    }
    
    //MARK: function to decrement value by incrementCount
    
    @IBAction func minusbtnFun(_ sender: Any) {
        outputLabelValue -= incrementCount
        assignValueInString()
    }
    
    //MARK: function to reset all the values and outputLabel
    
    @IBAction func resetButtonFunction(_ sender: Any) {
        outputLabelValue = 0
        incrementCount = 1
        assignValueInString()
    }
    
    //MARK: function to change the increment/decrement factor by 2
    
    @IBAction func incrementByTwoFunction(_ sender: Any) {
        incrementCount = 2
    }

}
