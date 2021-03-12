//
//  extraView.swift
//  amarildoBanakieri
//
//  Created by Amarildo on 5.3.21.
//

import SwiftUI
import Kingfisher

//struct extraView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        extraView(extraPost: Post)
//    }
//}

protocol MakingExtraView {
    
    var strDrinkThumb:String { get }
    var strDrink:String { get }
    var strAlcoholic:String {get}
    var strInstructions: String {get}
}


struct extraView: View {
    
    var extraPost: MakingExtraView
    
    
    var body: some View {
        
        
        ScrollView{
            
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomLeading) {
                    
                    KFImage(URL(string: extraPost.strDrinkThumb))
                        .resizable()
                        .overlay(Color.black.opacity(0.2))
                    
                    VStack(alignment: .leading){
                        Text(extraPost.strDrink)
                            .foregroundColor(.white)
                            .font(.title).fontWeight(.medium)
                            .padding()
                        
                        
                        Text(extraPost.strAlcoholic)
                            .foregroundColor(.white)
                            .font(.title2).fontWeight(.medium)
                            .padding()
                        
                    }
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                
                Text("Ingredients: ")
                    .foregroundColor(.white)
                    .font(.title).italic().fontWeight(.medium)
                    .padding()

                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                    
                ]
                , spacing: UIScreen.main.bounds.height / 40, content: {
                    
                    ForEach ((1...8), id: \.self) {
                        
                        Text("Ingredient \($0)")
                            .foregroundColor(.white)
                            .font(.headline).fontWeight(.light)
                    }
                    
                }
                )
                
                Text("Instructions: ")
                    .foregroundColor(Color.white)
                    .font(.title).italic().fontWeight(.medium)
                    .padding()
                
                
                Text(extraPost.strInstructions)
                    .foregroundColor(Color.white)
                    .font(.subheadline).fontWeight(.light)
                    .padding()
                
            }
        }.edgesIgnoringSafeArea(.all)
        .background(Color.black).ignoresSafeArea()
    }
}

// Hiding Tab Bar

struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder { return
        ViewControllerHolder(value:
                                UIApplication.shared.windows.first?.rootViewController ) }
}

extension EnvironmentValues {
    var viewController: ViewControllerHolder {
        get { return self[ViewControllerKey.self] }
        set { self[ViewControllerKey.self] = newValue }
    }
}

extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle =
                                    .automatic, @ViewBuilder builder: () -> Content) {
        // Must instantiate HostingController with some sort of view...
        let toPresent = UIHostingController(rootView:
                                                AnyView(EmptyView()))
        toPresent.modalPresentationStyle = style
        // ... but then we can reset rootView to include the environment
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, ViewControllerHolder(value:
                                                                        toPresent))
        )
        self.present(toPresent, animated: true, completion: nil)
    }
}
