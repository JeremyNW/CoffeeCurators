//
//  NewRecipeView.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/3/22.
//

import SwiftUI

struct NewRecipeView: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
    @State private var coffeeName = ""
    @State private var directions = "Recipe: "
    
    var body: some View {
        VStack {
            Text("Create a new recipe!")
                .font(.system(size: 35))
            ZStack {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.secondary)
                
                .frame(width: 300)
                .padding(30)
                Button{
                    print("Button pressed")
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .offset(x: 115, y: -90)
            }
            TextField("Recipe Name...", text: $coffeeName)
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
            Button{
                viewModel.addRecipe(coffeeName: coffeeName, directions: directions)
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
}
struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
