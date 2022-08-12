//
//  ProfileTab.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/4/22.
//

import SwiftUI
import Kingfisher
import FirebaseFirestore

struct ProfileView: View {
    
    var layout = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var recipe: Recipe?
    let db = Firestore.firestore()
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
    @State private var profilePictureUrl = ""
    @State private var userName = ""
    
    
    var filteredRecipes: [Recipe] {
        viewModel.recipes.filter { $0.userID.localizedCaseInsensitiveContains(viewModel.currentUser?.id ?? "") }
    }
    
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
                            .font(Font.custom("Cormorant-Regular", size: 25))
                            .foregroundColor(.white)
                    }
                    Divider()
                        .frame(width: 350, height: 1)
                        .overlay(.gray)
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
                ScrollView {
                    LazyVGrid(columns: layout, content: {
                        ForEach(filteredRecipes, id: \.self) { recipe in
                            ZStack{
                                VStack{
                                    KFImage(URL(string: recipe.recipePictureUrl))
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(20)
                                        .frame(width: 100, height: 100)
                                        .padding(.top, 2)
                                    Button(action: {
                                        deleteGrid(recipe: recipe)
                                        
                                    }) {
                                        Text("x")
                                            .font(.system(size:15))
                                            .foregroundColor(.white)
                                            .frame(width:30, height: 30)
                                            .background(Color.secondary)
                                            .cornerRadius(100)
                                    } .offset(x:35, y:-110)
                                    NavigationLink (
                                        destination:
                                            RecipeDetailView(recipe: .init(coffeeName: recipe.coffeeName, directions: recipe.directions, userID: recipe.userID, recipePictureUrl: recipe.recipePictureUrl))
                                        ,label: {
                                            Text(recipe.coffeeName + "\n")
                                                .lineLimit(2)
                                                .foregroundColor(.white)
                                                .font(Font.custom("Cormorant-SemiBold", size: 18))
                                                .padding(.top, -30)
                                        })
                                }
                            }
                        }
                    })
                }
                
            }.onAppear() {
                self.viewModel.fetchUserData()
                self.viewModel.fetchRecipes()
            }
            .background(Color("Background_color"))
            
        }
    }
}

extension ProfileView {
    
    func deleteGrid(recipe: Recipe) {
        guard let recipeID = recipe.id else { return }
        db.collection("recipe").document(recipeID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
    }
    
    
    
}
