//
//  HomeScreen.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/3/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
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
            
            VStack(spacing: 0) {
                Image("cclogo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .offset(y: -100)
                Text("Coffee Recipes")
                    .font(Font.custom("Cormorant-Bold", size: 40))
                    .padding()
                    .font(.title)
                    .foregroundColor(.white)
                    .offset(y: -100)
                Divider()
                    .frame(width: 350, height: 1)
                    .overlay(.gray)
                    .offset(y: -100)
                
                    .toolbar {
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
                        TextField("Search..", text: $searchText)
                            .autocapitalization(.none)
                            .font(Font.custom("Cormorant-Bold", size: 30))
                    } .foregroundColor(Color("Background_color"))
                        .padding(.leading, 13)
                    
                } .frame(height: 40)
                    .cornerRadius(13)
                    .padding()
                    .offset(y: -100)
                
                List{
                    ForEach(filteredRecipes, id: \.self) { recipe in
                        
                        RecipeListCell(recipe: recipe)
                        
                    }
                }
                .padding(.top, -100)
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


