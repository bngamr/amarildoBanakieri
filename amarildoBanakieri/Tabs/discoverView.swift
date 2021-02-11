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

struct ProductView: View {

    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        VStack {
            ForEach(networkManager.posts) { post in
                ZStack {
                    KFImage(URL(string: post.strDrinkThumb!))
                            .resizable()
                            .scaledToFill()
                            .overlay(Color.black.opacity(0.2))

                    Text(post.strDrink!)
                            .position(x: 100, y: 40)
                            .foregroundColor(.white)
                            .font(Font.headline.weight(.medium))

                    Text("Coctail\nMaker")
                            .position(x: 100, y: 110)
                            .foregroundColor(.white)
                            .font(.custom("Rockwell", size: 40))
                            .multilineTextAlignment(.center)
                }
            }
        }.onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct Foto: Identifiable {
    let id: String
    let title: String
}

let fotot = [
    Foto(id: "1", title: "foto1"),
    Foto(id: "2", title: "foto2"),
    Foto(id: "3", title: "foto3")
]

