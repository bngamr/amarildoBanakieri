//
//  PostData.swift
//  amarildoBanakieri
//
//  Created by User on 11.1.21.
//

import Foundation

struct Results: Codable {
    let drinks: [Drink]
    
}

struct ResultsPosht: Codable {
    let drinks: [Drink]
    
}

struct Drink: Codable, Identifiable, Hashable {

    var id: String {
        return idDrink
    }
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
    let strAlcoholic: String
    let strInstructions: String
    //ingredientet :/
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    
}
