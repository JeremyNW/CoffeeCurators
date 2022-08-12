//
//  RecipeListCell.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/8/22.
//

import SwiftUI
import Kingfisher

struct RecipeListCell: View {
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    @State var recipe: Recipe
    @State var isFavorited = false
    @State var showDetails = false
    @State private var recipePictureUrl = ""
    
    var body: some View {
        HStack{
            KFImage(URL(string: recipe.recipePictureUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 100, height: 100)
               
            VStack{
                    Text(recipe.coffeeName)
                    .font(Font.custom("Cormorant-Regular", size: 24))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
            } .frame(width: 150, height: 100)
            Spacer()
            Button(action: {
                self.isFavorited.toggle()
                viewModel.likeRecipe(recipe: recipe, favorited: recipe.isFavorite == false ? true : false)
            }, label: {

                Image(systemName: recipe.isFavorite == false ? "heart" : "heart.fill")
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 50, height: 50)
            })
           
            .buttonStyle(BorderedButtonStyle())
            .frame(width: 50, height: 50)
            .padding()
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


