//
//  BrandList.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct BrandList: View {
    @State private var isOn: Bool = false
    @Binding var colorScheme: Bool
    
    @State private var searchText = ""
    
    var filteredBrands : [Brand] {
        guard !searchText.isEmpty else { return brands}
        return brands.filter{$0.brandName.localizedCaseInsensitiveContains(searchText)}
    }
    
    var body: some View {
            ZStack {
                VStack(spacing: 20) {
                    NavigationStack {
                        List(filteredBrands, id: \.id){
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
                        }
                    }.searchable(text: $searchText)
                }
                
            }.environment(\.colorScheme, isOn ? .light : .dark)
        }
    var searchResults: [Brand] {
            if searchText.isEmpty {
                return filteredBrands
            } else {
                return filteredBrands.filter { $0.brandName.contains(searchText) }
            }
        }
}

@available(iOS 16.0, *)
struct BrandList_Previews: PreviewProvider {
    static var previews: some View {
        BrandList(colorScheme: .constant(false))
    }
}
