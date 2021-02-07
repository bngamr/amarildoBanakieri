//
//  PostData.swift
//  amarildoBanakieri
//
//  Created by User on 11.1.21.
//

import Foundation

struct Results: Codable {
    let drinks: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return idDrink
    }
    let idDrink: String
    let strDrink: String?
    let url: String?
    let strDrinkThumb: String?
}
