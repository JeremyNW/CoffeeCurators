//
//  RecipeDetailView.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/3/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    @State private var coffeeName = ""
    @State private var directions = ""
    @State private var userID = ""
    
    
    var body: some View {
        ZStack{
            Color("Background_color")
        VStack {
            Text("\(recipe.coffeeName) Recipe")
                .font(Font.custom("Cormorant-SemiBold", size: 30))
                .foregroundColor(.white)
            ZStack {
                Image(systemName: "cup.and.saucer.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.secondary)
                
                    .frame(width: 300, height: 100)
                .padding(30)
                Button{
                    print("Button pressed")
                } label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .offset(x: 150, y: -90)
            }
            VStack{

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
                Text("Save")
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
        }
        }
        .background(Color("Background_color"))
}
    
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: .init(coffeeName: "coffee", directions: "directions", userID: "userID"))
    }
}
