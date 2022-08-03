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
    //
    //@EnvironmentObject var viewModel: CoffeeCuratorViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Let's sign you in!")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(Color("champagne_button"))
                
                
                VStack {
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        //                    viewModel.signIn(email:email, password: password)
                        print("SIGN IN")
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color("champagne_button"))
                            .fontWeight(.bold)
                            .frame(width: 350, height: 40)
                            .background(Color("sendAnInvite_button_light_brown"))
                        
                    })  .cornerRadius(40)
                    NavigationLink(destination: Text("SignUpView"), label: {
                        Text("Don't have an account yet?")
                            .foregroundColor(Color("NoAccountYet"))
                    })
                    .padding()
                    
                }.padding()
                
                Spacer()
            } .background(Color("Background_color"))
        }

    }
}
