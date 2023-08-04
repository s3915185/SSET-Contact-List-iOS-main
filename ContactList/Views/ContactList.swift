//
//  ContactList.swift
//  ContactList
//
//  Created by Tom Huynh on 7/13/22.
//

import SwiftUI

struct ContactList: View {
    @State private var isOn: Bool = false
    @Binding var colorScheme: Bool
    
    var body: some View {
        ZStack {
            
            Image(self.isOn ? "whitebg_image" : "blackbg_image")
                .resizable()
                .scaledToFill()
//                .ignoresSafeArea(.all, edges: .all)
                .padding([.top, .bottom], -60)
                .animation(.linear(duration: 0.5))

            VStack(spacing: 20) {
                Toggle("", isOn: $isOn)
                    .padding(.trailing, 70)
                    .tint(.black)
                    .animation(.linear(duration: 0.5))
                NavigationView {
                    
                    List(contacts){
                        contact in
                        NavigationLink{
                            ContactCard(contact: contact)
                        } label: {
                            ContactRow(contact: contact)
                        }.listRowBackground(Color.clear)
                        .navigationTitle("CAR BRANDS")
                        
                    }.listStyle(.inset)
                }
                .padding(.leading, 65)
                .padding(.trailing, 65)
            }
            
        }
        .environment(\.colorScheme, isOn ? .light : .dark)
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList(colorScheme: .constant(false))
    }
}
