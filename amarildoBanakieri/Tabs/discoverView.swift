import SwiftUI
import Kingfisher

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

struct PostPosht: View {
    var postPosht: DrinkPosht
    var body: some View {
        
        ZStack {
            KFImage(URL(string: postPosht.strDrinkThumb))
                .resizable()
                .scaledToFit()
                .overlay(Color.black.opacity(0.2))
                .cornerRadius(20)
                .padding()
            
            
            Text(postPosht.strDrink)
                .foregroundColor(.white)
                .font(.custom("Rockwell", size: 20))
            
        }
    }
}


struct Post: View {
    
    var post: Drink
    var body: some View {
        
        ZStack {
            
            KFImage(URL(string: post.strDrinkThumb))
                .resizable()
                .overlay(Color.black.opacity(0.2))
            
            Text(post.strDrink)
                .foregroundColor(.white)
                .font(.custom("Rockwell", size: 30))
            
        }
    }
}

struct ProductView: View {
    
    @State var count: CGFloat = 0
    @State var backgroundOffset: CGFloat = 0
    @ObservedObject var networkManager = NetworkManager()
    
    @Environment(\.viewController) private var viewControllerHolder:
        ViewControllerHolder
    
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    
    var body: some View {
        
        ScrollView{
            VStack {
                GeometryReader { g in
                    
                    HStack(spacing: 0){
                        
                        ForEach(networkManager.posts) { post in
                            // fotot dhe emrat e koktejlve
                            
                            ZStack {
                                Post(post: post)
                                    .onTapGesture {
                                        self.viewController?.present(style: .formSheet) {
                                            extraView(extraPost: post)
                                        }
                                    }
                                
                                // Indikatoret
                                HStack {
                                    
                                }
                                
                                .onAppear(perform: {
                                    networkManager.fetchData()
                                })
                                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2.3,
                                       alignment: .bottom)
                            }
                            .offset(x: -(self.backgroundOffset * UIScreen.main.bounds.width))
                            .animation(.default)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 )
                            .gesture(
                                DragGesture(minimumDistance: 20)
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
                        }
                    }
                }.edgesIgnoringSafeArea(.all)
                .onAppear(perform: networkManager.fetchData)
                
                HStack {
                    ForEach(0..<networkManager.posts.count, id: \.self) { index in
                        
                        let size = CGFloat(self.backgroundOffset == CGFloat(index) ? 15 : 8)
                        
                        Circle()
                            .fill(Color.gray)
                            .frame(width: size, height: size)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2))
                        
                    }
                }.frame(height: UIScreen.main.bounds.height / 4, alignment: .center)
                
                HStack {
                    Text("Today Recepies")
                        .foregroundColor(.white)
                        .scaledToFill()
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Button ("View More") {
                        
                    }
                    .foregroundColor(.gray)
                    .scaledToFill()
                    .font(.footnote)
                    
                } .onAppear(perform: networkManager.fetchData)
                .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 20)
                
                ScrollView (.horizontal){
                    HStack (spacing: 15){
                        
                        ForEach(networkManager.postsPosht) { postPosht in
                            
                            // fotot dhe emrat e koktejlve
                            Button {
                                self.viewController?.present(style: .formSheet) {
                                    extraView(extraPost: postPosht)
                                }
                            }
                            label: {
                                PostPosht(postPosht: postPosht)
                                    
                                    .frame(width: UIScreen.main.bounds.width / 1.7, height: UIScreen.main.bounds.height / 2.4)
                            }
                        }
                    }
                }.onAppear(perform: networkManager.fetchDataPosht)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
            }.frame(height: UIScreen.main.bounds.height)
        }.edgesIgnoringSafeArea(.top)
    }
}
