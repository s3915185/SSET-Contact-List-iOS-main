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
        VStack {
            car.back
                .resizable()
                .scaledToFit()
                .opacity(0.4)
            Divider()
            Spacer(minLength: 20)
        }.overlay {
            Text(car.carName)
                .font(.custom("SouvenirGotURWTOTReg W03 Rg",size: 20))
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
            CarRow(car: cars[2])
                .previewLayout(.fixed(width: 300, height: 70))
            CarRow(car: cars[3])
                .previewLayout(.fixed(width: 300, height: 70))
            CarRow(car: cars[4])
                .previewLayout(.fixed(width: 300, height: 70))
            CarRow(car: cars[5])
                .previewLayout(.fixed(width: 300, height: 70))
            CarRow(car: cars[6])
                .previewLayout(.fixed(width: 300, height: 70))
            CarRow(car: cars[7])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
