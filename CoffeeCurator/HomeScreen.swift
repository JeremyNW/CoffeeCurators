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
            ZStack {
                VStack {
                    HStack {
                        Text("COFFEE RECIPES")
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
                    List (viewModel.recipes, id: \.self) { recipe in
                           
                                RecipeListCell(recipe: recipe)
                            
                            .listRowBackground(Color("Background_color"))
                        }
              
//                        .onDelete { offset in
//                            viewModel.recipes.remove(atOffsets: offset)
//
//                        }
            }.listStyle(.plain)
                }
                }.background(Color("Background_color"))
            }
        }
    }


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
