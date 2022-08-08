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
            ZStack {
                VStack {
                    Text("Favorite Recipes")
                        .font(Font.custom("Cormorant-SemiBold", size: 26))
//                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    List {
                        ForEach(viewModel.recipes, id: \.self) { recipe in
                            NavigationLink{

                            }
                            label: {
                    HStack{

                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .leading)
                                .foregroundColor(.white)
                                .padding()
                       
                            VStack {
                                Text(recipe.coffeeName)
                                    .font(.title3)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                              
                            }
                            Image(systemName: "heart")
                                .foregroundColor(.white)
                                .padding()
                        
                    }
                }
            }
                .listRowBackground(Color("Background_color"))
                 
                    }.listStyle(.plain)
                }
            }.background(Color("Background_color"))
         }
    }
}
struct FavoriteRecipes_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipes()
    }
}
