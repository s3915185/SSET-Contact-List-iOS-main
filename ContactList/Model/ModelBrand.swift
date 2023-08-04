//
//  ModelBrand.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import Foundation
import CoreLocation

var brands = decodeJsonFromBrandJsonFile(jsonFileName: "brands.json")

// How to decode a json file into a struct
func decodeJsonFromBrandJsonFile(jsonFileName: String) -> [Contact] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Contact].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Contact]
}
