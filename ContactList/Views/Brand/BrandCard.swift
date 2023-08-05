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
    @Binding var colorScheme: Bool
    
    var body: some View {
        ZStack {
        ScrollView {
                VStack {
                    VStack {
                        Text(brand.brandName)
                            .font(.custom(brand.font, size: 40))
                            .bold()
                        .padding(.top)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Image(systemName: "phone.fill")
                        Text(brand.brandEmail)
                            .padding(.trailing)
                    }
                    Spacer()
                    if (brand.imageName == "astonmartin_logo") {
                        brand.image
                            .fixedSize()
                    }
                    else {
                        brand.image
                            .resizable()
                            .frame(width: 300, height: 300)
                    }
                    Spacer()
                    HStack {
                        Text("Overview")
                            .font(.custom(brand.font, size: 20))
                            .bold()
                            .padding(.leading)
                        Spacer()
                    }
                        
                    Spacer()
                    
                    HStack {
                        Text(brand.brandDescription)
                            .font(.custom("MSouvenirGotURWTOTReg W03 Rg", size: 15))
                        .padding(.leading)
                        Spacer()
                    }
                        
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.colorScheme, colorScheme ? .light : .dark)
        
    }
}

struct BrandCard_Previews: PreviewProvider {
    static var previews: some View {
        BrandCard(brand:  brands[0], colorScheme: .constant(false))
        BrandCard(brand:  brands[1], colorScheme: .constant(false))
        BrandCard(brand:  brands[2], colorScheme: .constant(false))
        BrandCard(brand:  brands[3], colorScheme: .constant(false))
        BrandCard(brand:  brands[4], colorScheme: .constant(false))
        BrandCard(brand:  brands[5], colorScheme: .constant(false))
        BrandCard(brand:  brands[6], colorScheme: .constant(false))
        BrandCard(brand:  brands[7], colorScheme: .constant(false))
    }
}
