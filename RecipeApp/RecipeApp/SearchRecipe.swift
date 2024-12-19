//
//  SearchRecipe.swift
//  RecipeApp
//
//  Created by DDUKK on 20/11/24.
//

import SwiftUI

struct SearchRecipe: View {
    @ObservedObject var receipeModel = RecipeViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(receipeModel.receipeList){
                        receipe in
                        NavigationLink {
                            RecipeDetails(recipe: receipe)
                        } label: {
                            Text(receipe.title)
                        }
                    }
                }
            }.navigationBarTitle("Receipes")
                .navigationBarTitleDisplayMode(.automatic)
                .searchable(text: $searchText)
        }
    }
}

struct SearchRecipe_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipe()
    }
}
