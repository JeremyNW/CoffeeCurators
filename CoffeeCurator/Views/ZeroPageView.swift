//
//  ZeroPageView.swift
//  CoffeeCurator
//
//  Created by Nataliya Durdyeva on 8/3/22.
//

import Foundation
import SwiftUI
//import Firebase
//import FirebaseAuth
//import FirebaseStorage
//import FirebaseFirestore

struct ZeroPageView: View {
    
//    @EnvironmentObject var viewModel: CofeeCuratorViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment:. leading, spacing: 80) { 
                Group {
                    HStack {
                        NavigationLink(destination: SignInView(), label: {
                            Text("Sign In")
                                .font(Font.custom("Cormorant-Bold", size: 20))
                                .frame(maxWidth: 400, maxHeight: 40)
                                .background(Color("champagne_button"))
                                .foregroundColor(Color("Background_color"))
                                .cornerRadius(10)
                        })
                        .padding()
                        
                        NavigationLink(destination: SignUpView(), label: {
                            Text("Sign Up")
                                .font(Font.custom("Cormorant-Bold", size: 20))
                                .frame(maxWidth: 400, maxHeight: 40)
                                .background(Color("SignUpButton"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        .padding()
                    }
                } .frame(maxHeight: .infinity, alignment: .bottom)
                
                
            }
            .background(Image("iced_coffee_2_N")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            )
            
        }
        
        
        
    }
    //            navigationTitle("FIRST PAGE")
    //       .onAppear() {
    //            viewModel.signedIn = viewModel.isSignedIn
}

 

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZeroPageView()
                .preferredColorScheme(.dark)
        }
    }
}
