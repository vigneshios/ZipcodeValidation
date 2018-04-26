//
//  ZipCodes.swift
//  ValidatingZipCodes
//
//  Created by Apple on 26/04/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import Foundation

class Zipcode {
    static let instance = Zipcode()
    
    func readJsonFile(completion: @escaping ([Int]) -> Void) {
    
        guard let path = Bundle.main.path(forResource: "zipcodes", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
           
            guard let object = json as? [String: [Int]] else {return}
            if let zipArray = object["zip"] {
                completion(zipArray)
            }else {
                print("Json is invalid")
            }
        }catch {
            print(error)
        }
        
        
    }
}
