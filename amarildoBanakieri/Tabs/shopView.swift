//
//  shopView.swift
//  amarildoBanakieri
//
//  Created by User on 5.1.21.
//

import SwiftUI

struct shopView: View {
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            
            ShopView()
        }
    }
}

struct shopView_Previews: PreviewProvider {
    static var previews: some View {
        shopView()
    }
}

struct ShopView: View {
    
    
    var body: some View {
        
        Text("amr")
    }
}
