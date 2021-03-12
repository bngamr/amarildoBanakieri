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
