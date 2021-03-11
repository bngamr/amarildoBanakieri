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
    let drinks: [DrinkPosht]
}

struct ResultsFromUser: Codable {
    let drinks: [UserSearch]
    
}

struct Drink: Codable, Identifiable, Hashable, MakingExtraView {

    var id: String {
        return idDrink
    }
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
    let strAlcoholic: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
   
    
}


struct DrinkPosht: Codable, Identifiable, MakingExtraView {
    var id: String {
        return idDrink
    }
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
    let strAlcoholic: String
    let strInstructions: String
}

struct UserSearch: Codable, Identifiable, Hashable, MakingExtraView {
    var id: String {
        return idDrink
    }
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
    let strAlcoholic: String
    let strInstructions: String
}
