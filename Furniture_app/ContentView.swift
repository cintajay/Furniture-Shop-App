//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var searchText: String = ""
    var body: some View {
        ZStack {
            Color(.bg).ignoresSafeArea()
            
            VStack(alignment: .leading){
                AppBarView()
                TagLineView().padding(.leading)
                
                HStack {
                    HStack {
                        Image("Search")
                        TextField("Search Furniture", text: $searchText)
                    }.padding(.all, 20)
                        .background(Color(.white))
                        .cornerRadius(10)
                        .padding(.trailing)
                    Image("Scan")
                        .padding()
                        .background(Color("Primary"))
                        .cornerRadius(10)
                }.padding(.horizontal)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
            })
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width:42, height: 42)
                .cornerRadius(10)
        }.padding(.all)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", fixedSize: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", fixedSize: 28))
            .foregroundColor(Color("Primary"))
    }
}
