//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by DDUKK on 19/11/24.
//

import Foundation

class RecipeViewModel: ObservableObject{
    @Published var receipeList = [RecipeItem]()
    @Published var favReceipeList = [RecipeItem]()
    init(){
        fetchRecipes()
    }
    
    func fetchRecipes(){
        let apiUrl = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=pasta&maxFat=25&number=2&fillIngredients=true&apiKey=7663485e27df42c1b2e2c85b91481232")
        
        let dataTask = URLSession.shared.dataTask(with: apiUrl!) { data, response, error in print("error \(String(describing: error))")
            
            if error == nil && data != nil {
                let recipeData = try! JSONDecoder().decode(Recipes.self, from: data!)
                DispatchQueue.main.async {
                    self.receipeList = recipeData.results
                }
            }
        }
        dataTask.resume()
    }
    
    func addToFav(recipe: RecipeItem){
        favReceipeList.append(recipe)
    }
}


