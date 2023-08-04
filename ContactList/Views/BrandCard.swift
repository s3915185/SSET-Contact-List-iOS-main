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
                    Text("vc")
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
