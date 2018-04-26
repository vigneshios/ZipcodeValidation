//
//  ViewController.swift
//  ValidatingZipCodes
//
//  Created by Apple on 26/04/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zipcodeTxtFld: UITextField!
    @IBOutlet weak var validationLbl: UILabel!
    
    // Variables
    var zipCodeArray : [Int]!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validationLbl.isHidden = true
        
        Zipcode.instance.readJsonFile { (zips) in
           self.zipCodeArray = zips
            print(self.zipCodeArray)
        }
    }
    
    @IBAction func validatingZipcode(_ sender: Any) {
        guard let txt = zipcodeTxtFld.text else {return}
        validationLbl.isHidden = false
        if let enteredZipcode = Int(txt) {
            if isZipCodeValid(enteredZipcode) {
                validationLbl.text = "\(enteredZipcode) is a valid zip code"
            }else {
                
                validationLbl.text = "Not a valid zipcode"
                zipcodeTxtFld.text = ""
            }
        }
    }
    
    func isZipCodeValid(_ zipcode: Int) -> Bool {
        return zipCodeArray.contains(zipcode)
    }
    
}

