//
//  extraView.swift
//  amarildoBanakieri
//
//  Created by Amarildo on 5.3.21.
//

import SwiftUI
import Kingfisher
import RealmSwift


//struct extraView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        extraView(extraPost: Post)
//    }
//}

class MakingExtraView {
    
    var strDrinkThumb:String
    var strDrink:String
    var strAlcoholic:String
    var strInstructions: String
    //ingredientet :/
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    
    init(strDrinkThumb:String,var strDrink:String,var strAlcoholic:String, var strInstructions: String, var strIngredient1: String?,var strIngredient2: String?, var strIngredient3: String?,  var strIngredient4: String?,  var strIngredient5: String? ) {
        self.strDrinkThumb = strDrinkThumb
        self.strDrink = strDrink
        self.strAlcoholic = strAlcoholic
        self.strInstructions = strInstructions
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        
    }
}


struct extraView: View{
    
    var extraPost: Drink
    
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
                
                HStack{
                Text("Ingredients")
                    .foregroundColor(.white)
                    .font(.title).italic().fontWeight(.medium)
                    .padding()
                    
                    Spacer()
                    
                    Button {}
                        label: {  HStack {
                            Text("ADD TO CART")
                                .font(.caption)
                                .foregroundColor(.black)
                            Image(systemName: "cart")
                                .foregroundColor(.black)
                        }
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10.0)
                        }.padding()
                }

                VStack(alignment:.leading){

                    if let in1 = extraPost.strIngredient1 {
                        HStack{
                            
                        Text(in1)
                            .foregroundColor(Color.white)
                            .font(.headline).fontWeight(.light)
                            .padding(.horizontal)
                            
                            Spacer()
                        }
//                            Circle()
//                                .stroke(checked ? Color("green") : Color.gray,lineWidth: 1)
//                        .onTapGesture(perform:{checked.toggle()})
                    }
                    
                    if let in2 = extraPost.strIngredient2 {
                        Text(in2)
                            .foregroundColor(Color.white)
                            .font(.headline).fontWeight(.light)
                            .padding()
                    }
                    if let in3 = extraPost.strIngredient3 {
                        Text(in3)
                            .foregroundColor(Color.white)
                            .font(.headline).fontWeight(.light)
                            .padding(.horizontal)
                    }
                    if let in4 = extraPost.strIngredient4 {
                        Text(in4)
                            .foregroundColor(Color.white)
                            .font(.headline).fontWeight(.light)
                            .padding()
                    }
                    if let in5 = extraPost.strIngredient5 {
                        Text(in5)
                            .foregroundColor(Color.white)
                            .font(.headline).fontWeight(.light)
                            .padding(.horizontal)
                    }
                }.padding(.horizontal)

                
                Text("Instructions")
                    .foregroundColor(Color.white)
                    .font(.title).italic().fontWeight(.medium)
                    .padding()
                
                
                Text(extraPost.strInstructions)
                    .foregroundColor(Color.white)
                    .font(.subheadline).fontWeight(.light)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.bottom)
                
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


