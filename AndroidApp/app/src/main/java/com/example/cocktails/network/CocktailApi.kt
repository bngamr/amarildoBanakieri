package com.example.cocktails.network

import com.example.cocktails.data.Results
import retrofit2.http.GET
import retrofit2.http.Query

interface CocktailApi {
    @GET("search.php")
    suspend fun searchCocktails(@Query("s") query: String): Results

    @GET("search.php")
    suspend fun fetchCocktails(@Query("f") firstLetter: String): Results
}
