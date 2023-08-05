//
//  BrandList.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI

struct BrandList: View {
    @State private var isOn: Bool = false
    @Binding var colorScheme: Bool
    
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                NavigationView {

                    List(brands){
                        brand in
                        NavigationLink{
                            BrandCard(brand: brand, colorScheme: $isOn)
                        } label: {
                            BrandRow(brand: brand)
                        }.listRowBackground(Color.clear)
                            .navigationBarItems(leading: Text("CAR BRANDS").font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20)).foregroundColor(.red)
                                .toolbar {
                                    ToolbarItem(placement:
                                            .navigationBarTrailing) {
                                                Toggle(isOn: $isOn) {
                                                    Image(systemName:
                                                            isOn ? "lightbulb" : "lightbulb.fill").foregroundColor(isOn ? .black : .white)
                                                }
                                                .background(Color.clear)
                                            }
                                })
                    }.listStyle(.inset)
                }
            }
            
        }
        .environment(\.colorScheme, isOn ? .light : .dark)
    }
}

struct BrandList_Previews: PreviewProvider {
    static var previews: some View {
        BrandList(colorScheme: .constant(false))
    }
}
