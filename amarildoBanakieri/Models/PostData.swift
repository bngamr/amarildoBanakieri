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

struct Drink: Codable, Identifiable {
    var id: String {
        return idDrink
    }
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
}

//let amr = Drink(idDrink: "22", strDrink: "omzemra", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")
//let bng = Drink(idDrink: "23", strDrink: "omjeta", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")
//
//let varigenin = [amr, bng]
