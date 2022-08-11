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
                       .font(Font.custom("Cormorant-SemiBold", size: 30))
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
                   }.padding()
                   List {
                       ForEach(0..<10) { recipe in
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
                                   .padding(.bottom, 5)
                                   .foregroundColor(.white)
                            
                        }
                    }
                }
            }
//        }
                .listRowBackground(Color("Background_color"))
                      
                       }.foregroundColor(.white)
                       
                   }.listStyle(.plain)
                   
//                   Button(action: {
//                       viewModel.signout()
//                   }) {
//
//                           Text("Sign Out")
//                           .padding()
//                               .background(Color("champagne_button"))
//                               .cornerRadius(30)
//                               .font(Font.custom("Cormorant-SemiBold", size: 16))
//                               .foregroundColor(Color("Background_color"))
//
//                   }
                   .padding(30)
               }.onAppear() {
                   self.viewModel.fetchUserData()
                   self.viewModel.fetchRecipes()
               }
               .background(Color("Background_color"))
               .navigationBarTitleDisplayMode(.inline)
               .toolbar {
                   ToolbarItem(placement:.navigationBarLeading) {
                       Button(action: {
                           viewModel.signout()
                       }, label: {
                           Text ("Sign Out")
                               .foregroundColor(.white)
                               .frame(width: 350, height: 40)
                               .font(Font.custom("Cormorant-SemiBold", size: 18))
                       })
                       .padding(.trailing, 280)
                       .navigationBarTitleDisplayMode(.inline)
                       .toolbar {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               NavigationLink (
                                destination:
                                    NewRecipeView()
                               ,label: {
                                   Image(systemName: "plus")
                                       .foregroundColor(.white)
                                       .frame(width: 350, height: 40)
                                       .font(Font.custom("Cormorant-SemiBold", size: 18))
                               })
                               .padding(.trailing, 50)
                           }
                       }
                   }
               }
            }
        }
    }
}

