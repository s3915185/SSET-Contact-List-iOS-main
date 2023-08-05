//
//  ContentView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    @State var colorScheme: Bool = false
    var body: some View {
        WelcomeView(colorScheme: $colorScheme, isOn: $isOn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BrandList(colorScheme: .constant(false))
    }
}
