//
//  ContentView.swift
//  RecipeApp
//
//  Created by DDUKK on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection){
            SearchRecipe().tabItem{
                Image(systemName: "magnifyingglass")
            }.tag(1)
            Favourites().tabItem{
                Image(systemName: "star.fill")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//https://api.spoonacular.com/recipes/complexSearch?query=pasta&maxFat=25&number=2&apiKey=7663485e27df42c1b2e2c85b91481232
