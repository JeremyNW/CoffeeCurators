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
    
    var body: some View {
        HStack{
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .leading)
                    .foregroundColor(.white)
                    .padding()
           
            VStack(alignment: .leading) {
                    Text(recipe.coffeeName)
                        .font(.title3)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                  
                } .frame(width: 100, height: 100)
            Button(action: {
                self.isFavorited.toggle()
            }, label: {
                Image(systemName: self.isFavorited == false ? "heart" : "heart.fill")
                    .foregroundColor(.white)
                    .padding()
            })
            .frame(width: 70, height: 80)
            .buttonStyle(BorderedButtonStyle())
        }
        .overlay(
            NavigationLink(destination: RecipeDetailView(), isActive: $showDetails) {
                EmptyView()
            }
        )
        .onTapGesture {
            self.showDetails = true
        }
    }
}

struct RecipeListCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListCell(recipe: .init(coffeeName: "coffee", directions: "directions"))
    }
}
