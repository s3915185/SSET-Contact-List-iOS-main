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
struct ContentView: View {
    @State private var isOn: Bool = false
    @State var colorScheme: Bool = false
    var body: some View {
        WelcomeView(colorScheme: $colorScheme, isOn: $isOn)
    }
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BrandList(colorScheme: .constant(false))
    }
}
