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
struct CarCard: View {
    var car: Car    
    @Binding var colorScheme: Bool
    
    var body: some View {
        ZStack {
        ScrollView {
            HStack {
                if let image = UIImage(named: "\(car.imageName)_logo"){
                    Image (uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .background(Color.white)
                }
                else {
                    Text("\(car.carName)")
                        .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 40))
                        .bold()
                }
            }
            HStack {
                Image(car.imageName+"_image")
                    .resizable()
                    .scaledToFit()
            }
            HStack {
                Text("Overview")
                    .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 30))
                    .bold()
                    .padding(.leading)
                Spacer()
            }.background(colorScheme ? .black.opacity(0.3) : .white.opacity(0.3))
            
            HStack {
                Text(car.carDescription)
                    .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20))
                    .padding(.leading)
                Spacer()
            }
        }
        }
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.colorScheme, colorScheme ? .light : .dark)
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard(car:  cars[0], colorScheme: .constant(false))
    }
}
