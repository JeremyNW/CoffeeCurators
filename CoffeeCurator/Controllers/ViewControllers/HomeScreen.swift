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
            ZStack {
                VStack {
            Text("Find the best recipe")
                        .padding()
                    HStack{
                    HStack {
                        Image(systemName: "photo")
                  
                    }
                    HStack{
                        VStack {
                            Text("ingridients")
                            Text("directions")
                        }
                    }
                }
            }
        }
        .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
            }
      
            Text("Favorite Tab")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorite")
                }
            Text("Profile Tab")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
