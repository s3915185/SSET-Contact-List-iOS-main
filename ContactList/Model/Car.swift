//
//  Car.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 31/07/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Car: Identifiable, Codable{
    var id: Int
    var name: String
    var email: String
    var phone: String
    var imageName: String
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

