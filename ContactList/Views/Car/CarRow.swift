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

struct CarRow: View {
    var car: Car
    
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: 10)
                HStack {
                    VStack {
                        HStack {
                            Text(car.carName)
                                .font(Font.custom("SouvenirGotURWTOTReg W03 Rg", size: 20))
                                .opacity(1)
                                .shadow(color: Color.red.opacity(0.5) , radius: 3, x: 0, y: 10)
                        }
                        HStack {
                            ForEach(1..<5) { i in
                                Text(car.carName)
                                    .font(Font.custom("SouvenirGotURWTOTReg W03 Rg", size: 8))
                                    .opacity(0.3)
                            }
                        }
                        HStack {
                            ForEach(1..<9) {i in
                                Text(car.carName)
                                    .font(Font.custom("SouvenirGotURWTOTReg W03 Rg", size: 7))
                                    .opacity(0.2)
                            }
                        }
                        HStack {
                            ForEach(1..<10) {i in
                                Text(car.carName)
                                    .font(Font.custom("SouvenirGotURWTOTReg W03 Rg", size: 6))
                                    .opacity(0.1)
                            }
                        }
                        HStack {
                            ForEach(1..<15){ i in
                                Text(car.carName)
                                    .font(Font.custom("SouvenirGotURWTOTReg W03 Rg", size: 4))
                                    .opacity(0.1)
                            }
                        }
                        HStack {
                            ForEach(1..<20){ i in
                                Text(car.carName)
                                    .font(Font.custom("SouvenirGotURWTOTReg W03 Rg", size: 2))
                                    .opacity(0.1)
                            }
                        }
                        HStack {
                            ForEach(1..<30){ i in
                                Text(car.carName)
                                    .font(Font.custom("SouvenirGotURWTOTReg W03 Rg", size: 1))
                                    .opacity(0.1)
                            }
                        }
                    }
                }
                Spacer(minLength: 200)
                Divider()
                Spacer(minLength: 10)
            }.background(car.back.resizable().scaledToFit().opacity(0.4))
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
