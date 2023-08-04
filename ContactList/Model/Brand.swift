//
//  Brand.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import Foundation
import SwiftUI
import CoreLocation


struct Brand: Identifiable, Codable{
    var id: String
    var brandName: String
    var brandEmail: String
    var brandDescription: String
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

