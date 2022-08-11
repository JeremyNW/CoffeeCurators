//
//  ContentView.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/2/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import Foundation
import Firebase

struct AuthenticationLogicView: View {
    
    @EnvironmentObject var viewModel: CoffeeCuratorsViewModel
    
    var body: some View {
//                if viewModel.didAuthenticateUser != true {
      
        if viewModel.userSession != nil  {
           ContentView()
        }
        else {
            ZeroPageView()
        }
        
      
    }
}

struct ContentView: View {
    
    @State private var selection = 0

        var body: some View {
            TabView(selection: $selection) {
           
                HomeView()
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    }
                    .tag(0)
                FavoriteRecipes()
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "heart")
                            Text("Favorites")
                        }
                    }
                    .tag(1)
                ProfileView()
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    }
                    .tag(2)
                
            }.accentColor(Color("champagne_button"))
                .onAppear{
                    UITabBar.appearance().barTintColor = .init(named: "Background_color")
                }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
