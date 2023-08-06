//
//  BrandList.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI


enum SortDirection {
    case asc
    case desc
}

@available(iOS 16.0, *)
struct BrandList: View {
    @State private var isOn: Bool = false
    @Binding var colorScheme: Bool
    
    @State private var searchText = ""
    @State private var sortDirection: SortDirection = .asc
    
    var filteredBrands : [Brand] {
        guard !searchText.isEmpty else {
            return brands.sorted(by: sortDirection == .asc ? {$0.brandName < $1.brandName} : {$0.brandName > $1.brandName})
            
        }
        return brands.filter{$0.brandName.localizedCaseInsensitiveContains(searchText)}
            .sorted(by: sortDirection == .asc ? {$0.brandName < $1.brandName} : {$0.brandName > $1.brandName})
    }
    
    var sortDirectionText: String {
        sortDirection == .asc ? "Sort Descending" : "Sort Ascending"
    }
    var body: some View {
            ZStack {
                VStack(spacing: 20) {
                    NavigationStack {
                            Button(sortDirectionText) {
                                sortDirection = sortDirection ==  .asc ? .desc : .asc
                            }
                            List(filteredBrands, id: \.id){
                                brand in
                                NavigationLink{
                                    BrandCard(brand: brand, colorScheme: $isOn)
                                } label: {
                                    BrandRow(brand: brand)
                                }
                                .listRowBackground(Color.clear)
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
                                    }
                                )
                            }
                            .listStyle(.inset)
                    }.searchable(text: $searchText)
                        .navigationViewStyle(.stack)
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
