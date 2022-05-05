//
//  CardView.swift
//  nc1
//
//  Created by kimjimin on 2022/04/28.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(40)
            .shadow(radius: 16, y: 16)
    }
    
}

struct CardView: View {
    @AppStorage("likes") var likes = ""
    init() {
        likes = likes.padding(toLength: museums.count, withPad: "0", startingAt: 0)
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                ShakableViewRepresentable()
                    .allowsHitTesting(false)
                TabView{
                    ForEach(0..<museums.count, id:\.self) { num in
                        NavigationLink(destination: DetailView(num: num)){
                            VStack{
                                Image("\(num)")
                                    .resizable()
                                    .frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.2)
                                    .cornerRadius(20)
                                    .padding(.top, 40)
                                HStack{
                                    Text(museums[num].name)
                                        .font(.system(.title2)).bold()
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
                                    .onReceive(messagePublisher) {
                                        HapticManager.instance.notification(type: .success)
                                        let index = likes.index(likes.startIndex, offsetBy: num)
                                        if Array(likes)[num] == "1" {likes.replaceSubrange(index...index, with: "0")}
                                        else {likes.replaceSubrange(index...index, with: "1")}
                                    }
                                }
                                .padding([.leading, .trailing], UIScreen.screenWidth * 0.08)
                                .padding(.top, 10)
                                .foregroundColor(.white)
                                HStack {
                                    Text(museums[num].loc)
                                    Spacer()
                                }
                                .padding(.leading, UIScreen.screenWidth * 0.08)
                                .foregroundColor(.white)
                                Spacer()
                                Text("Shake device to mark!")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 30)
                            }
                            .frame(width: UIScreen.screenWidth * 0.90, height: UIScreen.screenHeight * 0.45)
                            .background(Color("Chocolate"))
                            .modifier(CardModifier())
                            .padding(.bottom, UIScreen.screenHeight * 0.2)
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }.blendMode(.darken)
            .accentColor(Color("Chocolate"))
            .foregroundColor(Color("Chocolate"))
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
