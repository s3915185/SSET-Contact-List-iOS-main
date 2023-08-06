//
//  BrandRow.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI

struct BrandRow: View {
    var brand: Brand
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: 10)
                HStack {
//                    brand.image
//                        .resizable()
//                        .frame(width: 50, height: 50)
                    Text(brand.brandName)
                        .font(Font.custom(brand.font, size: 20))
                }
                Spacer(minLength: 200)
                Divider()
                Spacer(minLength: 10)
            }.background(Image(brand.imageName).resizable().scaledToFit().opacity(0.5))
        }
    }
    
}

struct BrandRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BrandRow(brand: brands[7]).previewLayout(.fixed(width: 300, height: 70))
            BrandRow(brand: brands[1]).previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
