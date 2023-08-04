//
//  ModelCar.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import Foundation
import CoreLocation

var cars = decodeJsonFromCarJsonFile(jsonFileName: "cars.json")

// How to decode a json file into a struct
func decodeJsonFromCarJsonFile(jsonFileName: String) -> [Car] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Car].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Car]
}
