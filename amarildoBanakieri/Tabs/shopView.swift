//
//  shopView.swift
//  amarildoBanakieri
//
//  Created by User on 5.1.21.
//

import SwiftUI

struct shopView: View {
    var body: some View {
        Text("shop")
    }
}

struct shopView_Previews: PreviewProvider {
    static var previews: some View {
        shopView()
    }
}

//{
//    GeometryReader { proxy in
//
//        ScrollView {
//            TabView {
//                ForEach(0..<networkManager.posts.count, id: \.self) {  index in
//                    let post = networkManager.posts[index]
//
//                    ZStack {
//                        KFImage(URL(string: post.strDrinkThumb ))
//                                                .resizable()
//                                                .scaledToFill()
//                                                .overlay(Color.black.opacity(0.2))
//
//                        Text(post.strDrink)
//                            .position(x: 100, y: 40)
//                            .foregroundColor(.white)
//                            .font(Font.headline.weight(.medium))
//
//                        Text("Coctail\nMaker")
//                            .position(x: 100, y: 110)
//                            .foregroundColor(.white)
//                            .font(.custom("Rockwell", size: 40))
//                            .multilineTextAlignment(.center)
//
//                    }
//                }
//            }.onAppear(perform: {
//                networkManager.fetchData()
//
//            })
//        }
//        .frame(
//            width: proxy.size.width ,
//            height: proxy.size.height / 2
//        )
//        .tabViewStyle(PageTabViewStyle())
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//
//
//    }
//    .edgesIgnoringSafeArea(.all)
//}
