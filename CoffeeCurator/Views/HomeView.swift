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
    

    @State var searchText = ""
    @State var searching = false
    
    let recipe = [Recipe]()

    
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { $0.coffeeName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {

                VStack {

                    HStack {
                        Text("Coffee Recipes")
                            .font(Font.custom("Cormorant-Bold", size: 40))
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                        
                       
                        
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink (
                                destination: NewRecipeView(), label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            })
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("champagne_button"))
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search ..", text: $searchText)
                                .autocapitalization(.none)
                                .font(Font.custom("Cormorant-Bold", size: 30))
                        } .foregroundColor(Color("Background_color"))
                            .padding(.leading, 13)
                        
                    } .frame(height: 40)
                        .cornerRadius(13)
                        .padding()
                    
                    
                    List{
                        
                   ForEach(filteredRecipes, id: \.self) { recipe in
                       
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


