//
//  Recipe.swift
//  RecipeApp
//
//  Created by DDUKK on 19/11/24.
//

import Foundation

struct Recipes: Codable{
    let results: [RecipeItem]
}

struct RecipeItem: Codable,Identifiable{
    var id: Int
    let title: String
    let image: String
    let imageType: String
    let nutrition: Nutrition
    let missedIngredients: [MissedIngredient]
}

struct Nutrition: Codable{
    let nutrients: [Nutrient]
}

struct Nutrient: Codable {
    let name: String
    let amount: Double
    let unit: String
}

struct MissedIngredient: Codable{
    let name: String
    let amount: Double
}
