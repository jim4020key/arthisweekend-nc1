//
//  SearchView.swift
//  nc1
//
//  Created by kimjimin on 2022/05/04.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var query = ""
    //함수로?
    var array = ["포항시립미술관", "부산시립미술관", "경남도립미술관", "솔거미술관", "우양미술관", "대구미술관", "울산시립미술관"]
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                Button(action: {presentationMode.wrappedValue.dismiss()}){Text("Done")}
                    .foregroundColor(Color("Chocolate"))
                    .frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 40)
                    .padding(.top, UIScreen.screenHeight * 0.05)
            NavigationView {
                List {
                    ForEach(searchResults, id:\.self) { name in
                        NavigationLink(destination: DetailView(num: array.firstIndex(of: name)!)) {
                            Text(name)
                        }
                    }
                }.searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt:"Type something")
            }
            .blendMode(.darken)
            .accentColor(Color("Chocolate"))
            .foregroundColor(Color("Chocolate"))
            }
        }
    }
    
    var searchResults: [String] {
        if query.isEmpty {return array}
        else{
            return array.filter {$0.contains(query)}
        }
    }
}

