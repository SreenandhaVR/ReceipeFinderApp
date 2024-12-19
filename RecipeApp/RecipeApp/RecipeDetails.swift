//
//  RecipeDetails.swift
//  RecipeApp
//
//  Created by DDUKK on 20/11/24.
//

import SwiftUI

struct RecipeDetails: View {
    @ObservedObject var receipeModel = RecipeViewModel()
    var recipe: RecipeItem
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            HStack{
                VStack(alignment: HorizontalAlignment.leading){
                    Text(recipe.title).font(.system(size: 22)).bold()
                    Text(String(recipe.id)).font(.system(size: 12))
                }
                Spacer()
                AsyncImage(url: URL(string: recipe.image)) { img in
                    img.resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
            }
            Button {
                receipeModel.addToFav(recipe: recipe)
            } label: {
                Text("Add to favourites")
            }

            Text("Nutrients").padding(.vertical).font(.system(size: 20))
            List{
                let nutrients = recipe.nutrition.nutrients
                ForEach(nutrients, id: \.name){ nutnt in
                    HStack{
                        Text(nutnt.name)
                        Spacer()
                        Text(String(nutnt.amount))
                    }
                }
//                HStack{
//                    Text("Protein")
//                    Spacer()
//                    Text("33.28g")
//                }
            }
            
            Text("Ingredient").padding(.vertical).font(.system(size: 20))
            List{
                let ingredients = recipe.missedIngredients
                ForEach(ingredients, id: \.name){ ing in
                    HStack{
                        Text(ing.name)
                        Spacer()
                        Text(String(ing.amount))
                    }
                }
            }
            
        }.padding(30)
            .onAppear{
                print(recipe.image)
            }
        
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(recipe: RecipeItem(id: 1, title: "Chicken Biriyani", image: "", imageType: "", nutrition: Nutrition(nutrients: []), missedIngredients: []))
    }
}
