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
                    List {
                        ForEach(viewModel.recipes, id: \.self) { recipe in
                            NavigationLink{
                                
                            }
                        label: {
                            HStack{
                                HStack {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 100, height: 100, alignment: .leading)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                                HStack{
                                    VStack {
                                        Text(recipe.coffeeName)
                                            .font(.title3)
                                            .padding(.bottom, 5)
                                            .foregroundColor(.white)
                                        //                                Text("Milk, espresso, etc...")
                                        //                                    .padding(.bottom, 3)
                                        //                                    .foregroundColor(.white)
//                                        Text(recipe.directions)
//                                            .foregroundColor(.white)
                                    
                                    }
//                                    Button {
////                                        viewModel.recipe.isFavorite ?? false ?
////                                        viewModel.unlikeRecipe() :
////                                        viewModel.likeRecipe()
//                                    } label: {
//                                        Image(systemName: viewModel.recipe.isFavorite ?? false ? "heart.fill" : "heart")
//                                            .font(.subheadline)
//                                            .foregroundColor(viewModel.recipe.isFavorite ?? false ? .red : .gray)
//                                    }
                                }
                            }
                        }.listRowBackground(Color("Background_color"))
                        }
                        .onDelete(perform: viewModel.delete)
          
                    }
                    .listStyle(.plain)
                    .onAppear() {
                        self.viewModel.fetchRecipes()
                    }
                    
                }
            }.background(Color("Background_color"))
                
        }
    }
    
    
}
//                        .onDelete { indexSet in
//                            self.viewModel.delete(recipe: viewModel.recipes.id, completion: <#T##((Bool) -> Void)?#>)









struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
