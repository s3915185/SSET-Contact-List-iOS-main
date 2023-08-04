//
//  Car.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import Foundation
import SwiftUI
import CoreLocation


struct Car: Identifiable, Codable{
    var id: Int
    var carName: String
    var carDescription: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var carBrand: Int
}
