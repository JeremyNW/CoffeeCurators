//
//  NewRecipeView.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/3/22.
//

import SwiftUI

struct NewRecipeView: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var coffeeName = ""
    @State private var directions = ""
    
    var body: some View {
        ZStack{
            Color("Background_color")
            VStack{
            Text("Create a new recipe!")
                    .font(Font.custom("Cormorant-SemiBold", size: 30))
                    .foregroundColor(.white)
            ZStack {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                
                .frame(width: 300)
                .padding(30)
                Button{
                    print("Button pressed")
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .offset(x: 80, y: -40)
            }
            TextField("Recipe Name...", text: $coffeeName)
                .font(Font.custom("Cormorant-Regular", size: 16))
                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                .padding()
            
            TextEditor(text: $directions)
                .frame(width: 300, height: 200, alignment: .topLeading)
                .font(Font.custom("Cormorant-Regular", size: 15))
                .padding()
                .font(.system(size: 15))
                .overlay( RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, lineWidth: 0.2)
                    .frame(width: 300))
            Button{
                viewModel.addRecipe(coffeeName: coffeeName, directions: directions)
                dismiss()
            } label: {
                Text("Save")
                    .font(Font.custom("Cormorant-SemiBold", size: 16))
                    .padding(15)
                    .background(Color("champagne_button"))
                    .cornerRadius(20)
                    .frame(height: 100)
                    .foregroundColor(Color("Background_color"))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
////                            .stroke(Color.black, lineWidth: 10)
//                    )
                    }
                }
                
            }.background(Color("Background_color"))
                
        }
    }

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
