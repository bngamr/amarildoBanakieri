package com.example.cocktails.ui

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.cocktails.data.CocktailRepository
import com.example.cocktails.data.Drink
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

class SearchViewModel(private val repository: CocktailRepository = CocktailRepository()) : ViewModel() {
    private val _results = MutableStateFlow<List<Drink>>(emptyList())
    val results: StateFlow<List<Drink>> = _results.asStateFlow()

    fun search(query: String) {
        viewModelScope.launch {
            _results.value = if (query.isNotBlank()) repository.search(query) else emptyList()
        }
    }
}
