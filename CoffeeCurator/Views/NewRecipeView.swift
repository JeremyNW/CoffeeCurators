//
//  NewRecipeView.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/3/22.
//

import SwiftUI
import Kingfisher

struct NewRecipeView: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    @Environment(\.presentationMode) var mode
    @Environment(\.dismiss) private var dismiss
    
    @State private var isShowingPhotoPicker = false
  
    var recipe: Recipe?
    
    var body: some View {
        VStack {
            ZStack{
                Color("Background_color")
                VStack{
                    Text("Create a new recipe!")
                        .font(Font.custom("Cormorant-SemiBold", size: 30))
                        .foregroundColor(.white)
                    
                    TextField("Recipe Name...", text: $viewModel.coffeeName)
                        .disableAutocorrection(true)
                        .font(Font.custom("Cormorant-Bold", size: 22))
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .padding(.bottom, 5)
                   
                    TextEditor(text: $viewModel.directions)
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 200, alignment: .topLeading)
                        .font(Font.custom("Cormorant-Medium", size: 18))
                        .padding()
                        .font(.system(size: 15))
                   
                    Button{
                        isShowingPhotoPicker.toggle()
                        dismiss()
                    } label: {
                        Text("Save")
                            .frame(width: 100)
                            .font(Font.custom("Cormorant-SemiBold", size: 16))
                            .padding(15)
                            .background(Color("champagne_button"))
                            .cornerRadius(20)
                            .foregroundColor(Color("Background_color"))
                    }
                }
            }  .sheet(isPresented: $isShowingPhotoPicker, content: {
                RecipePhotoSelectorView(recipe: recipe)
            })
            .padding(10)
        }
        .background(Color("Background_color"))
        
        .onAppear(perform: {
            viewModel.coffeeName.removeAll()
            viewModel.directions.removeAll()
        })
    }
}
private struct ProfilePhotoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 190, height: 140)
        
    }
}


