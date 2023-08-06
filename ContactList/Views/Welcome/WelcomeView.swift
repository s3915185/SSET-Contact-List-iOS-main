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

@available(iOS 16.0, *)
struct WelcomeView: View {
    
    @State var isWelcomeActive: Bool = true
    @Binding var colorScheme: Bool
    @Binding var isOn: Bool
    

    var body: some View {
        ZStack {
            if isWelcomeActive {
                GreetingView(active: $isWelcomeActive, colorScheme: $isOn)
                
            } else {
                BrandList(colorScheme: $colorScheme)
            }
        }
        .environment(\.colorScheme, isOn ? .light : .dark)
    }
}

@available(iOS 16.0, *)
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(colorScheme: .constant(false), isOn: .constant(false))
    }
}
