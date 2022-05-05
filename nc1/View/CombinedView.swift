//
//  CombinedView.swift
//  nc1
//
//  Created by kimjimin on 2022/05/02.
//

import SwiftUI

struct CombinedView: View {
    @SceneStorage("selectedTab")
    private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                    Text("All")
                }.tag(0)
            LikedView()
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Likes")
                }.tag(1)
        }
    }
    
}

struct CombinedView_Previews: PreviewProvider {
    static var previews: some View {
        CombinedView()
    }
}
