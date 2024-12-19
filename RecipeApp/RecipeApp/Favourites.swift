//
//  Favourites.swift
//  RecipeApp
//
//  Created by DDUKK on 20/11/24.
//

import SwiftUI

struct Favourites: View {
    @ObservedObject var receipeModel = RecipeViewModel()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    if(receipeModel.favReceipeList.count>0){
                        ForEach(receipeModel.favReceipeList){
                            receipe in
                            NavigationLink {
                                RecipeDetails(recipe: receipe)
                            } label: {
                                Text(receipe.title)
                            }
                        }
                    } else{
                        Text("No favourites")
                    }
                }
            }.navigationBarTitle("Favourites")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct Favourites_Previews: PreviewProvider {
    static var previews: some View {
        Favourites()
    }
}
