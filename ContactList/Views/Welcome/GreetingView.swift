//
//  GreetingView.swift
//  ContactList
//
//  Created by Tom Huynh on 7/26/22.
//

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    @Binding var colorScheme: Bool
    
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack{
            
            Image(self.isOn ? "whitebg_image" : "blackbg_image")
                .resizable()
                .scaledToFill()
//                .ignoresSafeArea(.all, edges: .all)
                .padding([.top, .bottom], -60)
                .animation(.linear(duration: 0.5))

            VStack(spacing: 20){
                Toggle("", isOn: $isOn)
                    .padding(.trailing, 70)
                    .tint(.black)

                Spacer()
                VStack(spacing: 0) {
                    Text("GERMANY")
                      .font(.system(size: 60))
                      .fontWeight(.heavy)
                      .foregroundColor(self.isOn ? .black : .white)
                      .animation(.linear(duration: 0.5))
                    
                    Text("""
                    LUXURY MODELS
                    CARS&BRANDS
                    """)
                      .font(.title3)
                      .fontWeight(.light)
                      .foregroundColor(self.isOn ? .black : .white)
                      .multilineTextAlignment(.center)
                      .animation(.linear(duration: 0.5))
                }
                ZStack{
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .cornerRadius(15)
                }
                
                Spacer()
                Button(action: {
                    active = false
                    colorScheme = isOn ? true : false
                }, label: {
                    Capsule()
                      .fill(self.isOn ? Color.black.opacity(0.2) : Color.white.opacity(0.2))
                      .padding(8)
                      .frame(height:80)
                      .overlay(Text("Forward")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(self.isOn ? .black : .white))
                      .animation(.linear(duration: 0.5))
                })
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true), colorScheme: .constant(false))
            .animation(.linear(duration: 0.5))
    }
}
