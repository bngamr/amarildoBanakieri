//
//  AppView.swift
//  amarildoBanakieri
//
//  Created by User on 5.1.21.
//

import SwiftUI

struct AppView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
       }
    
    var body: some View {
        
        TabView {
           
            discoverView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("Discover")
                }
           
            searchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
          
            
            shopView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("shop")
                }
        }
        .accentColor(.orange)
    }

struct AppView_Previews: PreviewProvider {
    static let order = shopView()
    static var previews: some View {
       AppView()
    
    }
}
}
