//
//  CarCard.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI
import CoreLocation
struct CarCard: View {
    var car: Car    
    @Binding var colorScheme: Bool
    
    var body: some View {
        ZStack {
        ScrollView {
            HStack {
                Image("\(car.imageName)_logo")
                    .resizable()
                    .scaledToFit()
            }.background(Color.white)
            HStack {
                Text("\(car.carName)")
                    .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 40))
                    .bold()
            }
            HStack {
                Image(car.imageName+"_image")
                    .resizable()
                    .scaledToFit()
            }
            HStack {
                Text("Overview")
                    .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 30))
                    .bold()
                    .padding(.leading)
                Spacer()
            }.background(colorScheme ? .black.opacity(0.3) : .white.opacity(0.3))
            
            HStack {
                Text(car.carDescription)
                    .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20))
                    .padding(.leading)
                Spacer()
            }
        }
        }
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.colorScheme, colorScheme ? .light : .dark)
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard(car:  cars[0], colorScheme: .constant(false))
    }
}
