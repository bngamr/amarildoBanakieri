package com.example.cocktails.data

import com.example.cocktails.network.NetworkModule

class CocktailRepository {
    private val api = NetworkModule.api

    suspend fun fetchDailyCocktails(): List<Drink> {
        return api.searchCocktails("margarita").drinks
    }

    suspend fun search(query: String): List<Drink> {
        return api.searchCocktails(query).drinks
    }

    suspend fun fetchByLetter(letter: String): List<Drink> {
        return api.fetchCocktails(letter).drinks
    }
}
