//
//  FavoriteRecipes.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/4/22.
//

import SwiftUI

struct FavoriteRecipes: View {
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    Text("Favorite Recipes")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    List {
                        ForEach(0..<6) { recipe in
                            NavigationLink{

                            }
                            label: {
                    HStack{
                        HStack {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .leading)
                                .foregroundColor(.white)
                                .padding()
                        }
                        HStack{
                            VStack {
                                Text("Beverage Name")
                                    .font(.title3)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                                Text("Milk, espresso, etc...")
                                    .padding(.bottom, 3)
                                    .foregroundColor(.white)
                                Text("Steam milk and add espresso shot .....")
                                    .foregroundColor(.white)
                            }
                            Image(systemName: "heart")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
            }
                .listRowBackground(Color("Background_color"))
                 
                    }.listStyle(.plain)
                }
            }.background(Color("Background_color"))
         }
    }
}
struct FavoriteRecipes_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipes()
    }
}
