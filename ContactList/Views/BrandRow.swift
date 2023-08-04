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
        HStack {
            brand.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(brand.brandName)
        }
    }
}

struct BrandRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BrandRow(brand: brands[0]).previewLayout(.fixed(width: 300, height: 70))
            BrandRow(brand: brands[1]).previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
