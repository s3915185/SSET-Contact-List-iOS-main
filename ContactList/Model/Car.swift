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
import SwiftUI
import CoreLocation


struct Car: Identifiable, Codable{
    var id: Int
    var carName: String
    var carDescription: String
    var imageName: String
    var image: Image {
        Image(imageName+"_image")
    }
    var back: Image {
        Image(imageName+"_back")
    }
    
    var carBrand: Int
}
