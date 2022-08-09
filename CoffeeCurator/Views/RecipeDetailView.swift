//
//  RecipeDetailView.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/3/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    @State private var recipeName = ""
    @State private var directions = ""
    
 
    
    var body: some View {
        VStack {
            Text("\(recipe.coffeeName) Recipe")
                .font(.system(size: 35))
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

            TextField(recipe.coffeeName, text: $recipeName)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                .padding()
                ZStack{
                TextEditor(text: $directions)
                    Text(recipe.directions).opacity(1).padding(.all, 8)
                }
            }
            Button{
                print("Button pressed")
            } label: {
                Text("Save")
                    .padding(15)
                    .background(Color.white)
                    .cornerRadius(20)
                    .frame(width: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
    }
}
    
//    func prepareForUpdateRecipe() {
//        let name = recipeName
//        let directions = directions
//
//        guard !name.isEmpty, !directions.isEmpty else { return }
//
//        viewModel.updateRecipe()
//        
//    }
    
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: .init(coffeeName: "coffee", directions: "directions"))
    }
}
