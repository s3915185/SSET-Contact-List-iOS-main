//
//  WelcomeView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/25/22.
//

import SwiftUI

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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(colorScheme: .constant(false), isOn: .constant(false))
    }
}
