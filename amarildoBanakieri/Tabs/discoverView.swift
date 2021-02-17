//import SwiftUI
//import Kingfisher
//
//struct discoverView: View {
//    var body: some View {
//        DetailView()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        discoverView()
//    }
//}
//
//struct DetailView: View {
//    var body: some View {
//
//        ZStack {
//            Color(.black).edgesIgnoringSafeArea(.all)
//            ProductView()
//        }
//    }
//}
//
//struct ProductView: View {
//
//    @ObservedObject var networkManager = NetworkManager()
//
//    var body: some View {
//
//        GeometryReader { proxy in
//            ScrollView(.horizontal)
//            {
//
//            HStack{
//
//
//            ForEach(networkManager.posts) { post in
//                GeometryReader { geo in
//
//                ZStack {
//                    KFImage(URL(string: post.strDrinkThumb))
//                            .resizable()
//                            .scaledToFill()
//                            .overlay(Color.black.opacity(0.2))
//
//
//                    Text(post.strDrink)
//                            .position(x: 100, y: 40)
//                            .foregroundColor(.white)
//                            .font(Font.headline.weight(.medium))
//
//                    Text("Coctail\nMaker")
//                            .position(x: 100, y: 110)
//                            .foregroundColor(.white)
//                            .font(.custom("Rockwell", size: 40))
//                            .multilineTextAlignment(.center)
//
//                }
//
//                .frame(height: 300)
//                .tabViewStyle(PageTabViewStyle())
//
//
//                }.frame(width: UIScreen.main.bounds.width)
//
//
//
//            }
//        }
//
//        }.onAppear(perform: {
//            networkManager.fetchData()
//        })
//
//            .frame(
//                        width: proxy.size.width ,
//                        height: proxy.size.height / 2
//                    )
//
//
//
//
//    }
//        .edgesIgnoringSafeArea(.all)
//
//
//    }
//}


import SwiftUI
import Kingfisher
import iPages

struct discoverView: View {
    var body: some View {
        DetailView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        discoverView()
    }
}

struct DetailView: View {
    var body: some View {

        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            ProductView()
        }
    }
}




struct Post: View {

    var post: Drink
    var body: some View {

        ZStack {
            KFImage(URL(string: post.strDrinkThumb))
                .resizable()
                .scaledToFill()
                .overlay(Color.black.opacity(0.2))


            Text(post.strDrink)
                .position(x: 100, y: 40)
                .foregroundColor(.white)
                .font(Font.headline.weight(.medium))

            Text("Coctail\nMaker")
                .position(x: 100, y: 110)
                .foregroundColor(.white)
                .font(.custom("Rockwell", size: 40))
                .multilineTextAlignment(.center)

        }
        .frame(height: 300)
        .frame(width: UIScreen.main.bounds.width)

    }
}



struct ProductView: View {

    @ObservedObject var networkManager = NetworkManager()
    var body: some View {

        ScrollView{
        
        
        iPages{
           
            ForEach(networkManager.posts) {post in
                Post(post: post)
            }
                
     
        }
        .frame(width: UIScreen.main.bounds.width, height: 300)

        }.onAppear(perform: networkManager.fetchData)
        }
    }



