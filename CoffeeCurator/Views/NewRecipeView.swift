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
//            NavigationLink(destination: ProfilePhotoSelectorView(),
//                           isActive: $viewModel.didCreateRecipe,
//                           label: {} )
//
            ZStack{
                Color("Background_color")
                VStack{
                    Text("Create a new recipe!")
                        .font(Font.custom("Cormorant-SemiBold", size: 30))
                        .foregroundColor(.white)
                    
//                    KFImage(URL(string: recipe?.recipePictureUrl ?? ""))
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 50, height: 50, alignment: .leading)
//
//                        .padding(30)
                    
                    TextField("Recipe Name...", text: $viewModel.coffeeName)
                        .font(Font.custom("Cormorant-Regular", size: 16))
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300)
                        .padding()
                    
                    TextEditor(text: $viewModel.directions)
                        .frame(width: 300, height: 200, alignment: .topLeading)
                        .font(Font.custom("Cormorant-Regular", size: 15))
                        .padding()
                        .font(.system(size: 15))
                        .overlay( RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 0.2)
                            .frame(width: 300))
                    
                    Button{
                        isShowingPhotoPicker.toggle()
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(Font.custom("Cormorant-SemiBold", size: 16))
                            .padding(15)
                            .background(Color("champagne_button"))
                            .cornerRadius(20)
                            .frame(height: 100)
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
//            directions = ""
//            coffeeName = ""
//            coffeeName.isEmpty == true
//            directions.removeAll()
//            viewModel.didCreateRecipe = false
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


