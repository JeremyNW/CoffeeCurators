//
//  RecipeDetailView.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/3/22.
//

import SwiftUI
import Kingfisher

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    @State private var coffeeName = ""
    @State private var directions = ""
    @State private var userID = ""
    @State private var recipePictureUrl = ""
    
    
    var body: some View {
        ZStack{
            Color("Background_color")
            VStack {
                Text("\(recipe.coffeeName) Recipe")
                    .font(Font.custom("Cormorant-SemiBold", size: 30))
                    .foregroundColor(.white)
                
                VStack{
                    
                    
                    KFImage(URL(string: recipe.recipePictureUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50, alignment: .leading)
                    TextField(recipe.coffeeName, text: $coffeeName)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .padding()
                    
                    TextEditor(text: $directions)
                        .frame(width: 300, height: 200, alignment: .topLeading)
                        .padding()
                        .font(.system(size: 15))
                        .overlay( RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 0.2)
                            .frame(width: 300))
                    
                }
                Button{
                    viewModel.addRecipe(coffeeName: coffeeName, directions: directions)
                } label: {
                    Text("Update Recipe")
                        .padding(15)
                        .background(Color("champagne_button"))
                        .cornerRadius(30)
                        .font(Font.custom("Cormorant-SemiBold", size: 16))
                        .foregroundColor(Color("Background_color"))
                    //                    .overlay(
                    //                        RoundedRectangle(cornerRadius: 20)
                    //                            .stroke(Color.black, lineWidth: 1)
                    //                    )
                }
            } .onAppear {
                coffeeName = recipe.coffeeName
                directions = recipe.directions
                recipePictureUrl = recipe.recipePictureUrl
                self.viewModel.fetchRecipes()
            }
            
        }
        .background(Color("Background_color"))
    }
    
}

