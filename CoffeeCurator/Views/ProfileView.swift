//
//  ProfileTab.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/4/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
    @State private var profilePictureUrl = ""
    @State private var userName = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
               VStack {
                   Text("Profile")
                       .font(Font.custom("Cormorant-Bold", size: 30))
                       .foregroundColor(.white)
                     
                   HStack {
                       KFImage(URL(string: viewModel.currentUser?.profilePictureUrl ?? self.profilePictureUrl))
                           .resizable()
                           .scaledToFill()
                           .frame(width: 100, height: 100, alignment: .leading)

                       .clipShape(Circle())
                       .cornerRadius(20)
                       
                       Text("\(viewModel.currentUser?.userName ?? self.userName)")
                       
                           .font(.title)
                           .foregroundColor(.white)
                    }
               }.navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                viewModel.signout()
                            }, label: {
                                Text ("Sign Out")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Cormorant-SemiBold", size: 18))
                            })
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink (
                             destination:
                                 NewRecipeView()
                            ,label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Cormorant-SemiBold", size: 18))
                            })
                            .padding()
                 }
            }
                   List {
                       ForEach(viewModel.recipes, id: \.self) { recipe in
                           if  recipe.userID == viewModel.currentUser?.id {
                           RecipeListCell(recipe: recipe)
                }
            }
        }
                .listRowBackground(Color("Background_color"))
                .listStyle(.plain)
               }.onAppear() {
                   self.viewModel.fetchUserData()
                   self.viewModel.fetchRecipes()
               }
               .background(Color("Background_color"))
               
            }
        }
    }


