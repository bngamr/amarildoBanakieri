package com.example.cocktails.data

import com.squareup.moshi.Json

data class Results(
    @Json(name = "drinks") val drinks: List<Drink>
)

data class Drink(
    @Json(name = "idDrink") val id: String,
    @Json(name = "strDrink") val name: String,
    @Json(name = "strDrinkThumb") val thumbnail: String,
    @Json(name = "strAlcoholic") val alcoholic: String,
    @Json(name = "strInstructions") val instructions: String,
    @Json(name = "strIngredient1") val ingredient1: String?,
    @Json(name = "strIngredient2") val ingredient2: String?,
    @Json(name = "strIngredient3") val ingredient3: String?,
    @Json(name = "strIngredient4") val ingredient4: String?,
    @Json(name = "strIngredient5") val ingredient5: String?
)
