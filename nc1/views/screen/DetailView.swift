//
//  DetailView.swift
//  nc1
//
//  Created by kimjimin on 2022/04/29.
//

import SwiftUI

struct DetailView: View {
    var num: Int
    @AppStorage("likes") var likes = ""
    @State private var showSharesheet = false
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("\(museums[num].name)").font(.system(.largeTitle)).bold()
                    Spacer()
                    Button(action:{
                        HapticManager.instance.notification(type: .success)
                        let index = likes.index(likes.startIndex, offsetBy: num)
                        if Array(likes)[num] == "1" {likes.replaceSubrange(index...index, with: "0")}
                        else {likes.replaceSubrange(index...index, with: "1")}
                    }) {
                        if Array(likes)[num] == "1" {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color.pink)
                                .font(.system(size: 25))
                        }
                        else {
                            Image(systemName: "heart")
                                .font(.system(size: 25))
                        }
                    }
                    Link(destination: URL(string: museums[num].url)!) {
                        Image(systemName: "arrowshape.turn.up.right.circle.fill")
                            .font(.system(size: 25))
                    }
                }
                .padding([.leading, .trailing], 30)
                .padding(.top, 10)
                if museums[num].book {
                    Text("   Reservation Required   ")
                        .foregroundColor(.white)
                        .background(Color("Chocolate").cornerRadius(20))
                        .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30)
                }
                Text("What's on").font(.system(.title)).underline().frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30).padding(.top, 20)
                ForEach(0..<museums[num].exhibit, id:\.self) { num in
                    Image("\(self.num)-\(num)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.screenWidth * 0.90)
                    Divider()
                }
                HStack {
                    Spacer()
                    Button(action: {self.showSharesheet = true}) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 25))
                    }.sheet(isPresented: $showSharesheet) {
                        ShareSheet(activityItems: ["App link HERE"])
                    }
                }.padding(30)
            }
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
