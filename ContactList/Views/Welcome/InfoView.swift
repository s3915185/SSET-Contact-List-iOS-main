//
//  InfoView.swift
//  ContactList
//
//  Created by Vu Tran Hoang on 05/08/2023.
//

import SwiftUI

struct InfoView: View {
    @Binding var toInfo: Bool
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Text("Tran Hoang Vu")
                        .foregroundColor(.black)
                    Text("S3915185")
                        .foregroundColor(.black)
                    Text("Software Engineering")
                        .foregroundColor(.black)
                    Button(action: {
                        toInfo = false
                    }, label: {
                        Text("Go back")
                    })
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(toInfo: .constant(false))
    }
}
