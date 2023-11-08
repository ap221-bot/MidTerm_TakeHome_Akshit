//
//  CanadianCityViewController.swift
//  Akshit_Patel_MT_8912820
//
//  Created by user232103 on 11/6/23.
//

import UIKit

class CanadianCityViewController: UIViewController, UIGestureRecognizerDelegate {

    //making neccessary outlets and variable
    @IBOutlet weak var errorMsgLbl: UILabel!
    @IBOutlet weak var flgImage: UIImageView!
    @IBOutlet weak var cityName: UITextField!
    var tapGesture: UITapGestureRecognizer!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        errorMsgLbl.isHidden = true //initially making errorMsgLbl hidden
        
        //crearting and configuring tapGesture for making keyboard toggle on tapping
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
    }
    
    //MARK: - FindMyCity Button action
    
    @IBAction func findMyCityBtnClicked(_ sender: Any) {
        
            if let cityNameText = cityName.text?.trimmingCharacters(in: .whitespaces).lowercased(), !cityNameText.isEmpty {
            let cityImage = cityNameText.capitalized + ".jpg"
            if let image = UIImage(named: cityImage)
            {
                //assignning the image to imageView
                errorMsgLbl.isHidden = true
                flgImage.isHidden = false
                flgImage.image = image
            }
            else
            {
                //when no image/city is found
                errorMsgLbl.text = "Sorry!! City not found in Canada"
                errorMsgLbl.textColor = UIColor.red
                errorMsgLbl.isHidden = false
                flgImage.isHidden = true
            }
                
        } else {
            
            //handling the case when no city name is entered
            errorMsgLbl.text = "Please first enter the city name"
            errorMsgLbl.isHidden = false
            errorMsgLbl.textColor = UIColor.red
            flgImage.isHidden = true
        }
        
    }
    
    //MARK: - Tap Gesture Handling
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        
        //checking if tap is in the cityname field
        if !cityName.point(inside: location, with: nil) {
            
            //dismissing the keyboard
            view.endEditing(true)
        }
    }

    //function which ensures that other gesture recognizers can work alongside the tap gesture
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
    }

}
