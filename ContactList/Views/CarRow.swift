//
//  CarRow.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI

struct CarRow: View {
    var car: Car
    
    var body: some View {
        HStack {
            Text(car.carName)
        }
    }
}

struct CarRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CarRow(car: cars[0])
                .previewLayout(.fixed(width: 300, height: 70))
            CarRow(car: cars[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
