//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("chair_1")
                .resizable()
                .frame(height: 400)
            DescriptionView()
        }.ignoresSafeArea()
    }
}

//VStack being the outer container stack instead of a ZStack causes design difficulties

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct DescriptionView: View {
    var body: some View {
        ZStack(alignment:.top) {
            Color("Bg") //only for top and bot parts
            VStack(alignment: .leading, spacing: 15) {
                Text("Luxury Swedian \nChair")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    ForEach(0..<5) { i in
                        Image("star")
                    }
                    Text("(4.9)")
                        .foregroundColor(Color("Primary"))
                }
                HStack {
                    Text("Description")
                        .fontWeight(.medium)
                    Text("Review")
                        .foregroundColor(Color("Primary"))
                        .fontWeight(.medium)
                }
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                    .opacity(0.6)
            }.padding()
            .padding(.top)
            .background(Color("Bg"))
            .cornerRadius(40)
            .offset(y: -40)
        }
    }
}
