//
//  HomeScreen.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/3/22.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        TabView {
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
                                Text("Milk, espresso, etc...")
                                    .padding(.bottom, 3)
                                    .foregroundColor(.white)
                                Text("Steam milk and add espresso shot .....")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }.listRowBackground(Color("Background_color"))
                }
            }.listStyle(.plain)
                }
                .background(Color("Background_color"))
    }
            }
        .tabItem {
            Image(systemName: "house.fill")
            HomeScreen()
            }
      
            Text("Favorite Tab")
                .tabItem {
                    Image(systemName: "heart.fill")
                   SignUpView()
                }
            Text("Profile Tab")
                .tabItem {
                    Image(systemName: "person")
                    RecipeDetailView()
                }
        
        }.accentColor(.primary)
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
