package com.example.cocktails.ui

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.cocktails.data.CocktailRepository
import com.example.cocktails.data.Drink
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

class HomeViewModel(private val repository: CocktailRepository = CocktailRepository()) : ViewModel() {
    private val _cocktails = MutableStateFlow<List<Drink>>(emptyList())
    val cocktails: StateFlow<List<Drink>> = _cocktails.asStateFlow()

    init {
        refresh()
    }

    fun refresh() {
        viewModelScope.launch {
            _cocktails.value = repository.fetchDailyCocktails()
        }
    }
}
