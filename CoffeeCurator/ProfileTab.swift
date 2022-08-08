//
//  ProfileTab.swift
//  CoffeeCurator
//
//  Created by Viktoriya Kudryashova on 8/4/22.
//

import SwiftUI

struct ProfileTab: View {
    
    @EnvironmentObject private var viewModel: CoffeeCuratorsViewModel
    
    var body: some View {
        NavigationView{
           ZStack {
               VStack {
                   Text("Profile")
                       .font(.title3)
                       .foregroundColor(.white)
                   HStack {
                       Image(systemName: "person.crop.circle")
                           .resizable()
                           .frame(width: 50, height: 50, alignment: .leading)
                           .foregroundColor(.white)
                           .padding()
                       Text("Name")
                           .font(.title)
                           .foregroundColor(.white)
                   }
                   List {
                       Section("Custom Recipes"){
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
            }
        }
                .listRowBackground(Color("Background_color"))
                       }.foregroundColor(.white)
                       
                   }.listStyle(.plain)
                   
                   Button(action: {
                       
                       viewModel.signout()
                   }) {
                       
                       ZStack {
                           RoundedRectangle(cornerRadius: 15)
                               .frame(width: 280, height: 35)
                               .foregroundColor(Color("dirty_light_pink"))
                           
                           Text("Sign Out")
                               .font((.system(size: 15, weight: .semibold, design: .default))
                               )
                       }
                   }
                   .padding(30)
               }.background(Color("Background_color"))
           }
        }
    }
}

struct ProfileTab_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab()
    }
}
