package com.example.cocktails.ui

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavGraph.Companion.findStartDestination
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.example.cocktails.ui.theme.CocktailsTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CocktailsTheme {
                Surface(color = MaterialTheme.colorScheme.background) {
                    MainScreen()
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MainScreen() {
    val navController = rememberNavController()
    val items = listOf("home", "search", "shop")
    Scaffold(
        bottomBar = {
            BottomNavigationBar(navController, items)
        }
    ) { inner ->
        NavHost(navController, startDestination = "home", modifier = Modifier.padding(inner)) {
            composable("home") {
                val vm: HomeViewModel = viewModel()
                HomeScreen(vm)
            }
            composable("search") {
                val vm: SearchViewModel = viewModel()
                SearchScreen(vm)
            }
            composable("shop") { PlaceholderScreen("Shop") }
        }
    }
}

@Composable
fun BottomNavigationBar(navController: androidx.navigation.NavHostController, items: List<String>) {
    androidx.compose.material3.NavigationBar {
        val navBackStackEntry by navController.currentBackStackEntryAsState()
        val current = navBackStackEntry?.destination?.route
        items.forEach { screen ->
            androidx.compose.material3.NavigationBarItem(
                selected = current == screen,
                onClick = {
                    navController.navigate(screen) {
                        popUpTo(navController.graph.findStartDestination().id) { saveState = true }
                        launchSingleTop = true
                        restoreState = true
                    }
                },
                label = { Text(screen.capitalize()) },
                icon = { }
            )
        }
    }
}

@Composable
fun HomeScreen(viewModel: HomeViewModel) {
    val items by viewModel.cocktails.collectAsState()
    androidx.compose.foundation.lazy.LazyColumn {
        items(items) { drink ->
            androidx.compose.material3.Text(drink.name)
        }
    }
}

@Composable
fun SearchScreen(viewModel: SearchViewModel) {
    var query by remember { mutableStateOf("") }
    val results by viewModel.results.collectAsState()

    androidx.compose.foundation.layout.Column {
        androidx.compose.material3.OutlinedTextField(
            value = query,
            onValueChange = {
                query = it
                viewModel.search(it)
            },
            label = { androidx.compose.material3.Text("Search") }
        )
        androidx.compose.foundation.lazy.LazyColumn {
            items(results) { drink ->
                androidx.compose.material3.Text(drink.name)
            }
        }
    }
}

@Composable
fun PlaceholderScreen(text: String) {
    androidx.compose.material3.Text(text)
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    CocktailsTheme {
        MainScreen()
    }
}
