//
//  ContentView.swift
//  nc1
//
//  Created by kimjimin on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("card")
    var card = true
    @State private var search = false
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    Button(action: {card.toggle()}){
                        if card {Image(systemName: "rectangle")
                                .font(.system(size: 20))
                        }
                        else {Image(systemName: "list.dash")
                                .font(.system(size: 20))
                        }
                    }
                    Button(action:{search.toggle()}) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20))
                    }
                    .padding(.leading, 15)
                    .sheet(isPresented: $search) {SearchView()}
                }.padding([.trailing, .top], 40)
                if card {CardView()}
                else {ListView()}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
