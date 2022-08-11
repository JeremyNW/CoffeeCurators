//
//  RecipeListCell.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/8/22.
//

import SwiftUI

struct RecipeListCell: View {
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    let recipe: Recipe
    @State var isFavorited = false
    @State var showDetails = false
    @State private var recipePictureUrl = ""
    
    var body: some View {
        HStack{
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 100, height: 100)
            VStack{
                    Text(recipe.coffeeName)
                    .font(Font.custom("Cormorant-Light", size: 28))
                        .font(.title3)
                   .foregroundColor(.white)
                    .padding(.bottom, 5)
                  
                } .frame(width: 150, height: 100)
            Button(action: {
                self.isFavorited.toggle()
                viewModel.likeRecipe(recipe: recipe, favorited: recipe.isFavorite == false ? true : false)
            }, label: {
                Image(systemName: recipe.isFavorite == false ? "heart" : "heart.fill")
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)

            })
            .buttonStyle(BorderedButtonStyle())
            .frame(width: 50, height: 50)
        }
        .listRowBackground(Color("Background_color"))
        .overlay(
            NavigationLink(destination: RecipeDetailView(recipe: .init(coffeeName: recipe.coffeeName, directions: recipe.directions, userID: recipe.userID, recipePictureUrl: recipe.recipePictureUrl)), isActive: $showDetails) {
                EmptyView()
            }
        )
        .onTapGesture {
            self.showDetails = true
        }
    }
}

//struct RecipeListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeListCell(recipe: .init(coffeeName: "coffee", directions: "directions", userID: ""))
//    }
//}
