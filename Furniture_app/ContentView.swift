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
            ScrollView() {
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
                    Text("Popular")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(1..<5) { i in
                                ProductCardView(width: 210, image: Image("chair_\(i)"))
                                    .padding(.trailing)
                            }
                            
                        }.padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(1..<5) { i in
                                ProductCardView(width: 180, image: Image("chair_\(i)"))
                                    .padding(.trailing)
                            }
                            
                        }.padding(.leading)
                    }
                    
                    
                    
                }
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

struct ProductCardView: View {
    let width: CGFloat
    let image: Image
    var body: some View {
        VStack {
            ZStack {
                image
                    .resizable()
                    .frame(width: width, height: (20/21)*width)
                    .cornerRadius(20)
            }
            
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0..<5) { i in
                    Image("star")
                }
                Spacer()
                Text("$ 12900")
                    .font(.system(size: 20))
                    .bold()
            }
            
        }.frame(width: width)
            .padding(.all)
            .background(Color(.white))
            .cornerRadius(20)
    }
}
