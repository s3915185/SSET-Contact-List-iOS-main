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

struct BrandRow: View {
    var brand: Brand
    @Binding var colorScheme: Bool
    @State private var isOn: Bool = false
    @State var isAnimating = false
    
    var body: some View {
            VStack {
                HStack {
                    VStack {
                        HStack {
                            Text(brand.brandName)
                                .font(Font.custom(brand.font, size: 20))
                                .opacity(1)
                                .shadow(color: Color.red.opacity(0.5) , radius: 3, x: 0, y: 10)
                        }
                        HStack {
                            ForEach(1..<5) { i in
                                Text(brand.brandName)
                                    .font(Font.custom(brand.font, size: 8))
                                    .opacity(0.3)
                            }
                        }
                        HStack {
                            ForEach(1..<9) {i in
                                Text(brand.brandName)
                                    .font(Font.custom(brand.font, size: 7))
                                    .opacity(0.2)
                            }
                        }
                        HStack {
                            ForEach(1..<10) {i in
                                Text(brand.brandName)
                                    .font(Font.custom(brand.font, size: 6))
                                    .opacity(0.1)
                            }
                        }
                        HStack {
                            ForEach(1..<15){ i in
                                Text(brand.brandName)
                                    .font(Font.custom(brand.font, size: 4))
                                    .opacity(0.1)
                            }
                        }
                        HStack {
                            ForEach(1..<20){ i in
                                Text(brand.brandName)
                                    .font(Font.custom(brand.font, size: 2))
                                    .opacity(0.1)
                            }
                        }
                        HStack {
                            ForEach(1..<30){ i in
                                Text(brand.brandName)
                                    .font(Font.custom(brand.font, size: 1))
                                    .opacity(0.1)
                            }
                        }
                    }
                }
                Spacer()
            }.background(
                        Image(brand.imageName)
                            .resizable()
                            .scaledToFit()
                            .opacity(0.4)
            )
            .frame(width: 400, height: 300)
    }
    
}

struct BrandRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BrandRow(brand: brands[3], colorScheme: .constant(true))
        }
    }
}
