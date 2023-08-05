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
    
    var body: some View {
        ZStack {
            Color("rmit-blue")
            .edgesIgnoringSafeArea(.bottom)
        ScrollView {
            
                VStack {
                    CircleImage(image: car.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    Text(car.carName)
                        .font(.system(size: 40))
                        .bold()
                    .foregroundColor(.white)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard(car:  cars[0])
    }
}
