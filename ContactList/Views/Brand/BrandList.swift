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


enum SortDirection {
    case asc
    case desc
}

@available(iOS 16.0, *)
struct BrandList: View {
    @State private var isOn: Bool = false
    @Binding var colorScheme: Bool
    @State var inBrandList:Bool = true
    
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
                                withAnimation(.easeIn(duration: 0.6)) {
                                    sortDirection = sortDirection ==  .asc ? .desc : .asc
                                }
                            }.foregroundColor(isOn ? Color.green : Color.yellow)
                            List(filteredBrands, id: \.id){
                                brand in
                                NavigationLink{
                                    BrandCard(brand: brand, colorScheme: $isOn)
                                } label: {
                                    BrandRow(brand: brand, colorScheme: $colorScheme)
                                }
                                .listRowBackground(Color.clear)
                                .navigationBarItems(leading: Text("CAR BRANDS").font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20)).foregroundColor(isOn ? .green : .yellow)
                                    .toolbar {
                                        ToolbarItem(placement:
                                                .navigationBarTrailing) {
                                                    Toggle(isOn: $isOn) {
                                                        Image(systemName:
                                                                "lightbulb.fill").foregroundColor(isOn ? .black : .yellow)
                                                    }.accentColor(Color.clear)
                                                    .background(Color.clear)
                                                }
                                    }
                                )
                            }
                            .listStyle(.inset)
                    }.searchable(text: $searchText)
                        .navigationViewStyle(.stack)
                        .accentColor(isOn ? Color.green : Color.yellow)
                }
                
            }.environment(\.colorScheme, isOn ? .light : .dark)
            .overlay {
                Image(isOn && inBrandList ? "logo_black" : "logo_white")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x: -150, y: 370)
                    .shadow(color: isOn ? Color.green.opacity(0.5) : Color.yellow.opacity(0.5) , radius: 1, x: 0, y: 10)
            }
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
