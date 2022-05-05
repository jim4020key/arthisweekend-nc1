//
//  ListView.swift
//  nc1
//
//  Created by kimjimin on 2022/04/28.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List (0..<museums.count) { num in
                NavigationLink(destination: DetailView(num: num)) {
                    Text(museums[num].name)
                }
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            }
            .font(.system(.title3, design:.serif))
            .environment(\.defaultMinListRowHeight, 65)
        }
        .blendMode(.darken)
        .accentColor(Color("Chocolate"))
        .foregroundColor(Color("Chocolate"))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
