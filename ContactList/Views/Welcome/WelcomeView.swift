//
//  WelcomeView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/25/22.
//

import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
    @State var colorScheme: Bool = false

    var body: some View {
        ZStack {
            if isWelcomeActive {
                GreetingView(active: $isWelcomeActive, colorScheme: $colorScheme)
            } else {
                ContactList(colorScheme: $colorScheme)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
