//
//  SignUpView.swift
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

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthViewModel
//    @Environment(\.presentationMode) var mode
    
    @State var email = ""
    @State var password = ""
    @State private var userName = ""
//
//    @State private var selectedPicture: UIImage?
//    @State private var picture: Image?
    
//    @State private var isShowingPhotoPicker = false
    

    var body: some View {
        
        NavigationView {
        VStack {
//            NavigationLink(destination: ProfilePhotoSelectorView(),
//                           isActive: $viewModel.didRegister,
//                           label: {} )
            
            VStack {
                Text("Let's create your profile!")
                    .font(.title)
                .bold()
                .foregroundColor(Color("champagne_button"))
                .padding()
                
                VStack {
                    
//                    Image(uiImage: selectedPicture!)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .padding()
//                        .onTapGesture { isShowingPhotoPicker = true }
                    
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
                    
                    TextField("Name", text: $userName)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    
                    }

                    Button(action: {

                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signUp(email: email, password: password, userName: userName)
                       

                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color("champagne_button"))
                            .fontWeight(.bold)
                            .frame(width: 350, height: 40)
                            .background(Color("sendAnInvite_button_light_brown"))
                    }).cornerRadius(40)
                NavigationLink(destination: SignInView(), label: {
                    Text("Have an account already?")
                        .foregroundColor(Color("NoAccountYet"))
                })
                        .padding()
                        .foregroundColor(.white)
                }
//            .sheet(isPresented: $isShowingPhotoPicker, content: {
//                    ProfilePhotoSelectorView()
     
                  
              
        
                Spacer()
            }  .background(Color("Background_color"))
   
    }
//    }
    }

}
    


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
