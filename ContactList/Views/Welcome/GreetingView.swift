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

struct GreetingView: View {
    @Binding var active: Bool
    @Binding var colorScheme: Bool
    @State private var toInfo: Bool = false
    
    @State private var isOn: Bool = true
    
    
    @State var title:String  = "WHIPPERS"
    @State var secondTitle:String = "CARS & BRANDS"
    @State var thirdTitle:String = "An app to display famous luxury brands and their cars"
    
    
    @State var animateTitle: String = ""
    @State var indexValue = 0
    @State var timeInterval: TimeInterval = 0.1
    
    @State var animateSecondTitle:String = ""
    @State var indexValue2 = 0
    @State var timeInterval2: TimeInterval = 0.1
    
    @State var animateThirdTitle:String = ""
    @State var indexValue3 = 0
    @State var timeInterval3: TimeInterval = 0.001
    
    @State var isAnimating = false
    
    var body: some View {
        ZStack{
                VStack(spacing: 20){
                
                    VStack(spacing: 0) {
                        Spacer()
                        HStack {
                            Text(animateTitle)
                                .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 80))
                                .onAppear {
                                    startAnimation()
                                }
                                .padding(.leading, 5)
                                .shadow(color: Color.black.opacity(0.5) , radius: 3, x: 0, y: 10)
                            Spacer()
                        }
                        .animation(.spring())
                        
                        
                        HStack {

                            Text(animateSecondTitle)
                                .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 30))
                                .foregroundColor(self.isOn ? .black : .white)
                                .multilineTextAlignment(.center)
                                .onAppear {
                                    startAnimation2()
                                }
                                .padding(.leading, 75)
                                .shadow(color: Color.black.opacity(0.5) , radius: 3, x: 0, y: 10)
                            Spacer()
                        }.animation(.spring())
                        
//                        Text("WHIPPERS")
//                            .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 80))
//                            .foregroundColor(self.isOn ? .black : .white)
//
                        Spacer()
                        HStack {
                            Text(animateThirdTitle)
                                .font(.custom("SouvenirGotURWTOTReg W03 Rg", size: 20))
                                .padding(.horizontal, 70)
                                .onAppear {
                                    startAnimation3()
                                }
                                .padding(.leading, 10)
                                .shadow(color: Color.black.opacity(0.5) , radius: 3, x: 0, y: 10)
                            Spacer()
                        }.animation(.spring())
                        
                        Spacer()
                    }
                    ZStack{
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.5) , radius: 10, x: 0, y: 10)
                            .scaleEffect(self.isAnimating ? 0.9 : 1)
                            .animation(Animation.easeOut(duration: 15)
                                .repeatForever())
                            .onAppear {
                                self.isAnimating = true
                            }
                    }
                    Spacer()
                    HStack {
                        Button(action:  {
                            toInfo.toggle()
                        }, label: {
                            Capsule()
                                .fill(self.isOn ? Color.black.opacity(0.2) : Color.white.opacity(0.2))
                                .padding(8)
                                .frame(height:80)
                                .shadow(color: Color.black.opacity(0.5) , radius: 3, x: 0, y: 10)
                                .overlay(Text("Builder Info")
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(self.isOn ? .black : .white))
                        })
                        Spacer()
                        Button(action: {
                            withAnimation(.easeIn(duration: 0.6)) {
                                active = false
                                isOn = self.isOn ? true : false
                                
                            }
                        }, label: {
                            Capsule()
                                .fill(self.isOn ? Color.black.opacity(0.2) : Color.white.opacity(0.2))
                                .padding(8)
                                .frame(height:80)
                                .shadow(color: Color.black.opacity(0.5) , radius: 3, x: 0, y: 10)
                                .overlay(Text("Forward")
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(self.isOn ? .black : .white))
                        }).scaleEffect(self.isAnimating ? 0.9 : 1)
                            .animation(Animation.easeOut(duration: 2)
                                .repeatForever())
                            .onAppear {
                                self.isAnimating = true
                            }
                    }
                }
        }
        .padding()
        .sheet(isPresented: $toInfo) {
            InfoView()
        }
        .environment(\.colorScheme, isOn ? .light : .dark)
        
        
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) {
            timer in
            if (indexValue < title.count) {
                animateTitle += String(title[title.index(title.startIndex, offsetBy: indexValue)])
                indexValue += 1
            } else {
                timer.invalidate()
            }
        }
    }
    
    func startAnimation2() {
        Timer.scheduledTimer(withTimeInterval: timeInterval2, repeats: true) {
            timer in
            if (indexValue2 < secondTitle.count) {
                animateSecondTitle += String(secondTitle[secondTitle.index(secondTitle.startIndex, offsetBy: indexValue2)])
                indexValue2 += 1
            } else {
                timer.invalidate()
            }
        }
    }
    
    func startAnimation3() {
        Timer.scheduledTimer(withTimeInterval: timeInterval2, repeats: true) {
            timer in
            if (indexValue3 < thirdTitle.count) {
                animateThirdTitle += String(thirdTitle[thirdTitle.index(thirdTitle.startIndex, offsetBy: indexValue3)])
                indexValue3 += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

struct InfoView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Image("builder_image")
                    .resizable()
                    .scaledToFit()
                    .blendMode(.normal)
            }
            HStack {
                Image(systemName: "arrow.down")
                    .opacity(1)
                    .padding()
            }
            Spacer()
            HStack {
                Image(systemName: "pencil")
                    .padding()
                Spacer()
                Text("Tran Hoang Vu")
                    .padding()
            }
            HStack {
                Image(systemName: "info.circle")
                    .padding()
                Spacer()
                Text("S3915185")
                    .padding()
            }
            HStack {
                Image(systemName: "lanyardcard")
                    .padding()
                Spacer()
                Text("Software Engineeering")
                    .padding()
            }
            Spacer(minLength: 100)
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true), colorScheme: .constant(false))
    }
}
