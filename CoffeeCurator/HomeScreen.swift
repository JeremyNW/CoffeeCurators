//
//  HomeScreen.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/3/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
//    @State private var coffeeName = ""
//
//    @State private var coffeeName = ""
    
    var body: some View {
            NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("FIND THE BEST RECIPE")
                            .padding()
                            .font(.title)
                        .foregroundColor(.white)
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
//                                showSheet.toggle()
                            }, label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            })
                        }
                    }
                    List {
                        ForEach(viewModel.recipes, id: \.self) { recipe in
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
                                Text(recipe.coffeeName)
                                    .font(.title3)
                                    .padding(.bottom, 5)
                                    .foregroundColor(.white)
//                                Text("Milk, espresso, etc...")
//                                    .padding(.bottom, 3)
//                                    .foregroundColor(.white)
                                Text(recipe.directions)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }.listRowBackground(Color("Background_color"))
                        }
//                        .onDelete(perform: viewModel.delete)
            }.listStyle(.plain)
                }
                .background(Color("Background_color"))

            }.onAppear() {
                self.viewModel.fetchRecipes()
            }
        }

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
