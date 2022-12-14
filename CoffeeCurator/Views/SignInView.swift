//
//  SignInView.swift
//  CoffeeCurator
//
//  Created by Nataliya Durdyeva on 8/3/22.
//

import Foundation
import SwiftUI
//import FirebaseAuth
//import FirebaseStorage
//import FirebaseFirestore
//import Firebase


struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: CoffeeCuratorsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Let's sign you in!")
                    .font(Font.custom("Cormorant-Bold", size: 30))
                    .padding()
                    .foregroundColor(Color("champagne_button"))
                VStack {
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .font(Font.custom("Cormorant-Light", size: 18))
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .font(Font.custom("Cormorant-Light", size: 18))
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email:email, password: password)
                        print("SIGN IN")
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color("champagne_button"))
                            .font(Font.custom("Cormorant-Bold", size: 18))
                            .frame(width: 350, height: 40)
                            .background(Color("NoAccountYet"))
                        
                    })  .cornerRadius(40)
                    NavigationLink(destination: SignUpView(), label: {
                        Text("Don't have an account yet?")
                            .font(Font.custom("Cormorant-Medium", size: 20))
                            .foregroundColor(Color("NoAccountYet"))
                    })
                    .padding()
                    
                }.padding()
                
                Spacer()
            } .background(Color("Background_color"))
        }.navigationBarHidden(true)
        
    }
}
