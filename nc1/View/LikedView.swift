//
//  LikedView.swift
//  nc1
//
//  Created by kimjimin on 2022/05/04.
//

import SwiftUI

struct LikedView: View {
    @AppStorage("likes") var likes = ""
    private var array = [Int]()
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                Text("Likes")
                    .font(.system(.largeTitle)).bold()
                    .foregroundColor(Color("Chocolate"))
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 40)
                    .padding(.top, UIScreen.screenHeight * 0.05)
                NavigationView {
                    List (0..<museums.count) { num in
                        if Array(likes)[num] == "1" {
                            NavigationLink(destination: DetailView(num: num)) {
                                Text(museums[num].name)
                            }
                            .navigationBarHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                        }
                        
                    }
                    .font(.system(.title3, design:.serif))
                    .environment(\.defaultMinListRowHeight, 65)
                }
                .blendMode(.darken)
                .accentColor(Color("Chocolate"))
                .foregroundColor(Color("Chocolate"))
            }
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}
