//
//  HomeScreen.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/3/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
    //    @State private var coffeeName = ""
    //
    //    @State private var coffeeName = ""
    
    var recipe: Recipe?
    
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
                                destination: NewRecipeView(recipe: .init(coffeeName: recipe?.coffeeName ?? "", directions: recipe?.directions ?? "", userID: recipe?.userID ?? "", recipePictureUrl: recipe?.recipePictureUrl ?? "")), label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            })
                        }
                    }
                    List{
                        
                   ForEach(viewModel.recipes, id: \.self) { recipe in
                       
                        RecipeListCell(recipe: recipe)
                                    
                    } .onDelete(perform: viewModel.delete)
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


