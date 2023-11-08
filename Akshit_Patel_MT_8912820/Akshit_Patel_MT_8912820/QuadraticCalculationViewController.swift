//
//  QuadraticCalculationController.swift
//  Akshit_Patel_MT_8912820
//
//  Created by user232103 on 11/4/23.
//

import UIKit

class QuadraticCalculationController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var valueA: UITextField!
    @IBOutlet weak var valueB: UITextField!
    @IBOutlet weak var valueC: UITextField!
    @IBOutlet weak var labelMsgVal: UILabel!
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        labelMsgVal.isHidden = true
        labelMsgVal.lineBreakMode = .byWordWrapping //handling the case of long message(doing word wrapping)
        labelMsgVal.numberOfLines = 0
        
        valueA.keyboardType = .numberPad  //for showing only numeric keyboard
        valueB.keyboardType = .numberPad
        valueC.keyboardType = .numberPad
        
        //crearting and configuring tapGesture for making keyboard toggle on tapping
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    //MARK: function to handle click on Calculate button
    
    @IBAction func calculateBtn(_ sender: Any) {
        
        handleTap()
        let aText = valueA.text ?? ""
        let bText = valueB.text ?? ""
        let cText = valueC.text ?? ""
        var errorMessage = ""
        
        //checking if any value is enetred or not and giving error messages (FOR MAKING APPLICATION USER FRIENDLY)
        guard !aText.isEmpty, !bText.isEmpty, !cText.isEmpty else
        {
            if aText.isEmpty && bText.isEmpty && cText.isEmpty
            {
                errorMessage = "Enter a value for A, B and C to find X"
            }
            else if aText.isEmpty, !bText.isEmpty, !cText.isEmpty
            {
                errorMessage = "Enter a value for A to find X"
            }
            else if !aText.isEmpty, bText.isEmpty, cText.isEmpty
            {
                errorMessage = "Enter a value for B and C to find X"
            }
            else if aText.isEmpty, !bText.isEmpty, cText.isEmpty
            {
                errorMessage = "Enter a value for A and C to find X"
            }
            else if aText.isEmpty, bText.isEmpty, !cText.isEmpty
            {
                errorMessage = "Enter a value for A and B to find X"
            }
            else if bText.isEmpty, !aText.isEmpty, !cText.isEmpty
            {
                errorMessage = "Enter a value for B to find X"
            }
            else if cText.isEmpty, !aText.isEmpty, !bText.isEmpty
            {
                errorMessage = "Enter a value for C to find X"
            }
            labelMsgVal.isHidden = false
            labelMsgVal.text = errorMessage
            labelMsgVal.textColor = UIColor.red
            return
        }
        
        //checking value entered in A is valid or not
        guard let a = Double(aText) else
        {
            labelMsgVal.isHidden = false
            labelMsgVal.text = "The value you entered for A is invalid."
            labelMsgVal.textColor = UIColor.red
            return
        }
        
        //handling the case when user enteres 0(x will be infinity) which is mathematically not possible
        if a == 0
        {
            labelMsgVal.isHidden = false
            labelMsgVal.text = "The value of A should not be zero."
            labelMsgVal.textColor = UIColor.red
            return
        }
        
        guard let b = Double(bText) else
        {
            labelMsgVal.isHidden = false
            labelMsgVal.text = "The value you entered for B is invalid."
            labelMsgVal.textColor = UIColor.red
            return
        }
        
        guard let c = Double(cText) else
        {
            labelMsgVal.isHidden = false
            labelMsgVal.text = "The value you entered for C is invalid."
            labelMsgVal.textColor = UIColor.red
            return
        }
        
        //calculating discriminant
        let discriminant = b * b - 4 * a * c
        
        //handling the different cases on the bases of discriminants
        if discriminant < 0
        {
            labelMsgVal.isHidden = false
            labelMsgVal.textColor = UIColor.black
            labelMsgVal.text = "There are no results since the discriminant is less than zero."
        }
        else if discriminant == 0
        {
            let x = -b / (2 * a)
            labelMsgVal.isHidden = false
            labelMsgVal.textColor = UIColor.black
            labelMsgVal.text = "There is only one value for X: \(x)"
        }
        else
        {
            let x1 = (-b + sqrt(discriminant)) / (2 * a)
            let x2 = (-b - sqrt(discriminant)) / (2 * a)
            labelMsgVal.isHidden = false
            labelMsgVal.textColor = UIColor.black
            labelMsgVal.text = "There are two values for X: \(x1) and \(x2)"
        }
    }
    
    //MARK: KeyBoard Dismissal and tap recognizer handling
    
    //function to dismiss the keyboard
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    
    //function which ensures that other gesture recognizers can work alongside the tap gesture
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    //MARK: function to handle click on clear button
    
    @IBAction func clearBtn(_ sender: Any) {
        valueA.text = ""
        valueB.text = ""
        valueC.text = ""
        labelMsgVal.text = ""
        labelMsgVal.isHidden = false
        labelMsgVal.text = "Enter a value for A, B and C to find X"
        labelMsgVal.textColor = UIColor.red
        handleTap()
    }
}
