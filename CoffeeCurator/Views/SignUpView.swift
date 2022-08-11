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
    @EnvironmentObject var viewModel: CoffeeCuratorsViewModel
    @Environment(\.presentationMode) var mode
    
    @State var email = ""
    @State var password = ""
    @State private var userName = ""
    @State private var selectedPicture: UIImage?
    @State private var picture: Image?
    
    @State private var isShowingPhotoPicker = false

    var body: some View {

        VStack {
            NavigationLink(destination: ProfilePhotoSelectorView(),
                           isActive: $viewModel.didRegister,
                           label: {} )
            
            VStack {
                Spacer()
                Text("Let's create your profile!")
                .font(Font.custom("Cormorant-Bold", size: 30))
                .foregroundColor(Color("champagne_button"))
                .padding(.bottom, 30)
                
                VStack {
                    
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .font(Font.custom("Cormorant-Light", size: 18))
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .font(Font.custom("Cormorant-Light", size: 18))
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)
                        
                    
                    TextField("Name", text: $userName)
                        .disableAutocorrection(true)
                        .font(Font.custom("Cormorant-Light", size: 18))
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
                            .font(Font.custom("Cormorant-SemiBold", size: 24))
                            .foregroundColor(Color("Background_color"))
                            .frame(width: 340, height: 50)
                            .background(Color("champagne_button"))
                            .clipShape(Capsule())
                            .padding()
                    })
                    .padding(.top, 24)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                NavigationLink(destination: SignInView(), label: {
                    Text("Have an account already?")
                        .font(Font.custom("Cormorant-Medium", size: 20))
                        .foregroundColor(Color("NoAccountYet"))
                })
                Spacer()
            }.navigationBarBackButtonHidden(true)
                
         
            .sheet(isPresented: $isShowingPhotoPicker, content: {
                    ProfilePhotoSelectorView()
                })
                .padding(10)
        
                Spacer()
            } .navigationBarBackButtonHidden(true)
            .background(Color("Background_color"))
            
            
        .onAppear(perform: {
                viewModel.didRegister = false
            })

    }

}
    
extension SignUpView {
 func loadPhoto() {
     
     guard let selectedPicture = selectedPicture else {return}
    picture = Image(uiImage: selectedPicture)
 }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
