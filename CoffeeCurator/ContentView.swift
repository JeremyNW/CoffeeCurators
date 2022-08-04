//
//  ContentView.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0

        var body: some View {
            TabView(selection: $selection) {
                HomeScreen()
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
                ProfileTab()
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    }
                    .tag(2)
            }.accentColor(.primary)

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
