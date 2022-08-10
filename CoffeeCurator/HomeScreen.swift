//
//  HomeScreen.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/3/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
    //    @State private var coffeeName = ""
    //
    //    @State private var coffeeName = ""
    
    let recipe = [Recipe]()
    
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        Text("Coffee Recipes")
                            .font(Font.custom("Cormorant-SemiBold", size: 30))
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink (
                                destination: NewRecipeView()
                            , label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            })
                        }
                    }
                    List(viewModel.recipes, id: \.self) { recipe in
                       
                        RecipeListCell(recipe: recipe)
                                    
                    }
                    .listRowBackground(Color("Background_color"))
                    .listStyle(.plain)
                }
            
   .background(Color("Background_color"))
   .onAppear() {
       self.viewModel.fetchRecipes()
      
   }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
