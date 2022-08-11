//
//  FavoriteRecipes.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/4/22.
//

import SwiftUI

struct FavoriteRecipes: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
    var body: some View {
        NavigationView{
                VStack {
                    Text("Favorite Recipes")
                        .font(Font.custom("Cormorant-SemiBold", size: 30))

                        .foregroundColor(.white)
                    List(viewModel.recipes, id: \.self) { recipe in
                        
                        if recipe.isFavorite == true {
          
                        RecipeListCell(recipe: recipe)
                        }
            }
                .listRowBackground(Color("Background_color"))
                 
                    }.listStyle(.plain)
                .background(Color("Background_color"))
            }
       
         } 
    }

struct FavoriteRecipes_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipes()
    }
}
