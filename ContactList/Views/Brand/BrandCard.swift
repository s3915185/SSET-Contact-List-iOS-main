/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Tran Hoang Vu
  ID: S3915185
  Created  date: 31/7/2023
  Last modified: 8/8/2023
  Acknowledgement:
      1. Your code on GITHUB
      2. WIKIPEDIA FOR INFORMATION OF EACH BRANDS AND CARS
*/
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
    @State private var sortDirection: SortDirection = .asc
    @State private var toBrandInfo: Bool = false
    
    var sortDirectionText: String {
        sortDirection == .asc ? "Sort Descending" : "Sort Ascending"
    }
    
    var filteredCars : [Car] {
        guard !searchText.isEmpty else {
            return cars.sorted(by: sortDirection == .asc ? {$0.carName < $1.carName} : {$0.carName > $1.carName})
            
        }
        return cars.filter{$0.carName.localizedCaseInsensitiveContains(searchText)}
            .sorted(by: sortDirection == .asc ? {$0.carName < $1.carName} : {$0.carName > $1.carName})
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollViewReader { scrollProxy in
                    ScrollView {
                        VStack {
                            VStack {
                                VStack {
                                    Link(destination: URL(string: brand.brandLink)!) {
                                        HStack{
                                            Text(brand.brandName)
                                                .font(.custom(brand.font, size: 40))
                                                .bold()
                                                .padding(.top)
                                                .shadow(color: colorScheme ? .black : .white , radius: 5, x: 5, y: 5)
                                                .foregroundColor(colorScheme ? .black : .white)
                                            Image(systemName: "info.circle.fill")
                                                .resizable()
                                                .frame(width: 15, height: 15)
                                                .padding(.top)
                                                .shadow(color: colorScheme ? .black : .white , radius: 5, x: 5, y: 5)
                                                .foregroundColor(colorScheme ? Color.green : Color.yellow)
                                        }
                                    }
                                    Spacer()
                                }
                                HStack {
                                    Spacer()
                                    Image(systemName: "phone.fill")
                                        .foregroundColor(colorScheme ? Color.green : Color.yellow)
                                    Text(brand.brandEmail)
                                        .padding(.trailing)
                                }
                                Spacer()
                                brand.image
                                    .resizable()
                                    .scaledToFit()
                                    .background(Color.white.cornerRadius(10))
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
                                    Button(sortDirectionText) {
                                        sortDirection = sortDirection ==  .asc ? .desc : .asc
                                    }
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
                                            }
                                        }
                                    }.searchable(text: $searchText)
                                        .navigationTitle("Models")
                                        .listStyle(.inset)
                                }
                                .frame(minHeight: 1000)
                                Spacer(minLength: 10)
                                Divider()
                            }
                        }
                    }                }
            }
        }
        .overlay {
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        toBrandInfo.toggle()
                        print("Clicked")
                    }, label: {
                        Image(systemName: "menucard.fill")
                            .foregroundColor(colorScheme ? Color.green : Color.yellow)
                            .shadow(color: colorScheme ? Color.green.opacity(0.5) : Color.yellow.opacity(0.5) , radius: 1, x: 0, y: 10)
                    }).padding(.trailing, 30)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $toBrandInfo) {
            BrandAdditionalInfoView(brand: brand, colorScheme: $colorScheme)
        }
        .environment(\.colorScheme, colorScheme ? .light : .dark)
        
        
    }
}

struct BrandAdditionalInfoView: View {
    var brand: Brand
    @Binding var colorScheme: Bool
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("History")
                            .font(.custom(brand.font, size: 30))
                            .bold()
                            .padding(.leading)
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text(brand.brandDescription2)
                            .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20))
                            .padding(.leading)
                        Spacer()
                    }
                    Divider()
                    
                    HStack {
                        Text("Additional Information")
                            .font(.custom(brand.font, size: 30))
                            .bold()
                            .padding(.leading)
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text(brand.brandDescription3)
                            .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20))
                            .padding(.leading)
                        Spacer()
                    }
                }
            }
        Divider()
        }
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
