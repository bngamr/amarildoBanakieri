//
//  searchView.swift
//  amarildoBanakieri
//
//  Created by User on 5.1.21.
//
import SwiftUI
import Kingfisher

struct searchView: View {
    
    @State
    var query: String = ""
    
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar { (string) in
                    print(string)
                    query = string
                }
                
                
                SearchView(text: $query)
            }
        }
    }
}

struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}


struct SearchView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @Binding var text: String
    @State private var isEditing = false
    
    @Environment(\.viewController) private var viewControllerHolder:
        ViewControllerHolder
    
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    
    var body: some View {
        
        NavigationView {
            
            
            ScrollView {
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                    
                ]
                , spacing: UIScreen.main.bounds.height / 20, content: {
                    ForEach(networkManager.userSearch, id: \.self) { post in
                        
                        
                        Button {
                            self.viewController?.present(style: .formSheet) {
                                extraView(extraPost: post)
                            }
                        }
                        label:{
                            
                            VStack(alignment: .center) {
                                KFImage(URL(string: post.strDrinkThumb))
                                    .resizable()
                                    
                                    .cornerRadius(7)
                                    .overlay(Color.black.opacity(0.2))
                                
                                Text(post.strDrink)
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.white)
                            }.frame(width: UIScreen.main.bounds.width / 2.3 , height: UIScreen.main.bounds.height / 3)
                            
                        }
                        
                        
                        
                    }
                }).padding(.horizontal)
                
                
                
            }.onAppear(perform: {
                        networkManager.searchData(userText: text)        })
            .onChange(of: text) { (text) in
                networkManager.searchData(userText: text)
            }.background(Color.black)
            
            .hiddenNavigationBarStyle()
            
        }
        
        
        
        
        
    }
}

struct SearchBar: UIViewRepresentable {
    
    let onTextChanged: (String) -> Void
    
    init(onTextChanged: @escaping (String) -> Void) {
        self.onTextChanged = onTextChanged
    }
    
    typealias UIViewType = UISearchBar
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search a coctail"
        searchBar.barStyle = .black
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(onTextChanged: onTextChanged)
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        
        let onTextChanged: (String) -> Void
        
        init(onTextChanged: @escaping (String) -> Void) {
            self.onTextChanged = onTextChanged
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            onTextChanged(searchText)
        }
    }
}

/// Hiding Navigation Bar:

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
