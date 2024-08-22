//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    var body: some View {
        ZStack {
            Color(.bg).ignoresSafeArea()
            
            VStack(alignment: .leading){
                AppBarView()
                TagLineView().padding(.leading)
                SearchAndScanView()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<categories.count) { i in
                            CategoryView(text: categories[i], isActive: i == selectedIndex)
                                .onTapGesture {
                                    selectedIndex = i
                                }
                        }
                    }
                }.padding(.all)
                
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

struct SearchAndScanView: View {
    @State var searchText: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                TextField("Search Furniture", text: $searchText)
            }.padding(.all, 20)
                .background(Color(.white))
                .cornerRadius(10)
                .padding(.trailing)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10)
            })
        }.padding(.horizontal)
    }
}

struct CategoryView: View {
    let text: String
    let isActive: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : .black.opacity(0.6))
            if isActive {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }.padding(.trailing)
    }
}
