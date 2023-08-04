//
//  BrandCard.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI
import CoreLocation
struct BrandCard: View {
    var brand: Brand
    
    var body: some View {
        ZStack {
            Color("rmit-blue")
            .edgesIgnoringSafeArea(.bottom)
        ScrollView {
            
                VStack {
                    MapView(coordinate: brand.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    CircleImage(image: brand.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    Text(brand.brandName)
                        .font(.system(size: 40))
                        .bold()
                    .foregroundColor(.white)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct BrandCard_Previews: PreviewProvider {
    static var previews: some View {
        BrandCard(brand:  brands[0])
    }
}
