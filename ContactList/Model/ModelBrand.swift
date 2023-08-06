/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Tran Hoang Vu
  ID: S3915185
  Created  date: 31/7/2023
  Last modified: 8/8/2023
  Acknowledgement:
      1. Your code on GITHUB
      2. WIKIPEDIA FOR INFORMATION OF EACH BRANDS AND CARS
*/

import Foundation
import CoreLocation

var brands = decodeJsonFromBrandJsonFile(jsonFileName: "brands.json")

// How to decode a json file into a struct
func decodeJsonFromBrandJsonFile(jsonFileName: String) -> [Brand] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Brand].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Brand]
}
