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


struct Brand: Identifiable, Codable{
    var id: Int
    var brandName: String
    var brandEmail: String
    var brandDescription: String
    var brandDescription2: String
    var brandDescription3: String
    var brandLink: String
    var imageName: String
    var font: String
    var image: Image {
        Image(imageName)
    }
    var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}


struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
