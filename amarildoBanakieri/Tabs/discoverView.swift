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
            
//            Circle()
//                .fill(Color.gray)
//                .frame(width:self.backgroundOffset)
            

        }
        .frame(height: 300)
        .frame(width: UIScreen.main.bounds.width)

    }
}



struct ProductView: View {
    @State var count: CGFloat = 0
    @State var backgroundOffset: CGFloat = 0
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {

        GeometryReader { g in
        
            HStack(spacing: 0){
           
            ForEach(networkManager.posts) { post in
                ZStack {
                Post(post: post)
                    
             
                    
                HStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width:self.backgroundOffset == 0 ? 20:10, height: self.backgroundOffset == 0 ? 20:10)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2))
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width:self.backgroundOffset == 1 ? 20:10, height: self.backgroundOffset == 1 ? 20:10)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2))
                        
                    Circle()
                        .fill(Color.gray)
                        .frame(width:self.backgroundOffset == 2 ? 20:10, height: self.backgroundOffset == 2 ? 20:10)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2))
                        
                    Circle()
                        .fill(Color.gray)
                        .frame(width:self.backgroundOffset == 3 ? 20:10, height: self.backgroundOffset == 3 ? 20:10)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2))
                        
                    Circle()
                        .fill(Color.gray)
                        .frame(width:self.backgroundOffset == 4 ? 20:10, height: self.backgroundOffset == 4 ? 20:10)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2))
                        
                    Circle()
                        .fill(Color.gray)
                        .frame(width:self.backgroundOffset == 5 ? 20:10, height: self.backgroundOffset == 5 ? 20:10)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2))
                        
                        
                    
                }.frame(width: g.size.width / 2, height: g.size.height / 2.2,
                        alignment: .bottom)
                
                
                }
                
            }.offset(x: -(self.backgroundOffset * UIScreen.main.bounds.width))
            .animation(.default)
            .frame(width: UIScreen.main.bounds.width, height: g.size.height / 2 )

                
     
        }
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        
                        if value.translation.width > 10 {
                            
                            if self.backgroundOffset > 0{
                            
                            self.backgroundOffset -= 1
                            }
                            
                        }else if value.translation.width < 10{
                            if self.backgroundOffset < 5{
                            self.backgroundOffset += 1
                            }
                        }
                        
                        
                    })
            )
            
        }.edgesIgnoringSafeArea(.all)
        .onAppear(perform: networkManager.fetchData)
        
    }
    }



