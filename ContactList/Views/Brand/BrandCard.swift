//
//  BrandCard.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 04/08/2023.
//

import SwiftUI
import CoreLocation
import MapKit


@available(iOS 16.0, *)
@available(iOS 16.0, *)
@available(iOS 16.0, *)
@available(iOS 16.0, *)
struct BrandCard: View {
    var brand: Brand
    @Binding var colorScheme: Bool
    @State private var searchText = ""
    
    var filteredCars : [Car] {
        guard !searchText.isEmpty else { return cars}
        return cars.filter{$0.carName.localizedCaseInsensitiveContains(searchText)}
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollViewReader { scrollProxy in
                    ScrollView {
                        VStack {
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
                                brand.image
                                    .resizable()
                                    .scaledToFit()
                                    .background(Color.white)
                                Spacer()
                                Divider()
                                HStack {
                                    Text("Overview")
                                        .font(.custom(brand.font, size: 30))
                                        .bold()
                                        .padding(.leading)
                                    Spacer()
                                }
                                
                                
                                HStack {
                                    Text(brand.brandDescription)
                                        .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20))
                                        .padding(.leading)
                                    Spacer()
                                }
                                Divider()
                                
                                HStack {
                                    Text("Location")
                                        .font(.custom(brand.font, size: 30))
                                        .bold()
                                        .padding(.leading)
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                            ScrollView {
                                VStack {
                                    MapView(coordinate: brand.locationCoordinate)
                                        .edgesIgnoringSafeArea(.top)
                                        .frame(height: 500)
                                        .padding(.all)
                                        .cornerRadius(20)
                                    
                                }
                            }
                            Divider()
                            Spacer(minLength: 50)
                            
                            VStack {
                                HStack {
                                    Text("CATALOG")
                                        .font(.custom(brand.font, size: 20))
                                        .padding(.leading)
                                    Spacer()
                                }
                                
                                NavigationStack {
                                    List(filteredCars, id: \.id) {
                                        car in
                                        Group {
                                            if (brand.id == car.carBrand) {
                                                NavigationLink {
                                                    CarCard(car: car, colorScheme: $colorScheme)
                                                } label: {
                                                    CarRow(car: car)
                                                }
                                                .cornerRadius(50)
                                                .id(car.carName)
                                            }
                                        }
                                    }.searchable(text: $searchText)
                                        .navigationTitle("Models")
                                        .listStyle(.inset)
                                }
                                .frame(minHeight: 1000)
                                Spacer(minLength: 100)
                            }
                        }
                    }                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.colorScheme, colorScheme ? .light : .dark)
        
    }
}

@available(iOS 16.0, *)
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
