//
//  ProfileTab.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/4/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    let items = Array(1...20).map({"Element \($0)"})
    let layout = [
        GridItem(.adaptive(minimum: 100))
    ]
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
                       ForEach(viewModel.recipes, id: \.self) { recipe in
                           if recipe.userID == viewModel.currentUser?.id {
                              // Text(recipe.coffeeName)
                               VStack{
                               Image("iced_coffee_2_N")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .border(Color.secondary)
                                   .cornerRadius(12)
                                  //.padding()
                                   .frame(width: 100, height: 100)
                               NavigationLink (
                                destination:
                                    RecipeDetailView(recipe: .init(coffeeName: recipe.coffeeName, directions: recipe.directions, userID: recipe.userID))
                               ,label: {
                                   Text(recipe.coffeeName)
                                       .foregroundColor(.white)
                                       .font(Font.custom("Cormorant-SemiBold", size: 18))
                               })
                               }
                }
            }
        })
                }
                .listRowBackground(Color("Background_color"))
                .listStyle(.plain)
               }.onAppear() {
                   self.viewModel.fetchUserData()
               }
               .background(Color("Background_color"))
               
            }
        }
    }


struct ProfileTab_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
