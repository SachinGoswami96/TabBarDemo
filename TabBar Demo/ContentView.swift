//
//  ContentView.swift
//  TabBar Demo
//
//  Created by SOTSYS216 on 22/05/21.
//

import SwiftUI

// Animating font size
struct AnimatableSFImage: AnimatableModifier {
    var size: CGFloat

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Self.Content) -> some View {
        content
            .font(.system(size: size))
    }
}

// helper extension
extension Image {
    func animatingSF(size: CGFloat) -> some View {
        self.modifier(AnimatableSFImage(size: size))
    }
}


struct ContentView: View {
  
    @State var enlargeIt1 = false
    @State var enlargeIt2 = true
  
    var body: some View {
      TabView {
          Text("Home Tab")
              .font(.system(size: 30, weight: .bold, design: .rounded))
              .onAppear {
                                self.enlargeIt1.toggle()
                                self.enlargeIt2.toggle()
                            }
              .tabItem {
                VStack{
                        Image(systemName: "house.fill")
                             .animatingSF(size: self.enlargeIt1 ? 30 : 15 )
                        Text("Home")
                    }.animation(.interpolatingSpring(mass: 0.7,
                           stiffness: 200, damping: 10, initialVelocity: 4))
                              }.tag(0)
              
            
       
          Text("Bookmark Tab")
              .font(.system(size: 30, weight: .bold, design: .rounded))
              .onAppear {
                                self.enlargeIt1.toggle()
                                self.enlargeIt2.toggle()
                        }
              .tabItem {
                VStack{
                  Image(systemName: "bookmark.circle.fill")
                       .animatingSF(size: self.enlargeIt1 ? 30 : 15 )
                  Text("Bookmark")
              }.animation(.interpolatingSpring(mass: 0.7,
                     stiffness: 200, damping: 10, initialVelocity: 4))
                        }.tag(1)
       
          Text("Video Tab")
              .font(.system(size: 30, weight: .bold, design: .rounded))
              .onAppear {
                                self.enlargeIt1.toggle()
                                self.enlargeIt2.toggle()
                        }
              .tabItem {
                VStack{
                  Image(systemName: "video.circle.fill")
                       .animatingSF(size: self.enlargeIt1 ? 30 : 15 )
                  Text("Video")
              }.animation(.interpolatingSpring(mass: 0.7,
                     stiffness: 200, damping: 10, initialVelocity: 4))
                        }.tag(2)
       
          Text("Profile Tab")
              .font(.system(size: 30, weight: .bold, design: .rounded))
              .onAppear {
                                self.enlargeIt1.toggle()
                                self.enlargeIt2.toggle()
                            }
              .tabItem {
                VStack{
                  Image(systemName: "person.crop.circle")
                       .animatingSF(size: self.enlargeIt1 ? 30 : 15 )
                  Text("Profile")
  }.animation(.interpolatingSpring(mass: 0.7,
         stiffness: 200, damping: 10, initialVelocity: 4))
            }.tag(3)
      }
      .onAppear() {
          UITabBar.appearance().barTintColor = .white
      }
      .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
