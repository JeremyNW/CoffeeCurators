//
//  ProfilePhotoSelectorView.swift
//  CoffeeCurator
//
//  Created by Nataliya Durdyeva on 8/8/22.
//

import Foundation
import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var isShowingPhotoPicker = false
    @State private var selectedPicture: UIImage?
    @State private var profilePicture: Image?
    
    @EnvironmentObject var viewModel: CoffeeCuratorsViewModel
    
    
    var body: some View {
        ZStack{
            Color("Background_color")
                .ignoresSafeArea(.all)
            VStack{
                Spacer()
                Text("Let's upload your profile picture!")
                    .font(Font.custom("Cormorant-Medium", size: 28))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("champagne_button"))
                Spacer()
                
                Button(action: { isShowingPhotoPicker.toggle() }, label: {
                    ZStack {
                        if let profilePicture = profilePicture {
                            profilePicture
                                .resizable()
                                .modifier(ProfilePhotoModifier())
                        } else {
                            Image(systemName: "plus")
                                .foregroundColor(Color("champagne_button"))
                                .modifier(ProfilePhotoModifier())
                        }
                    }
                })
                .sheet(isPresented: $isShowingPhotoPicker, onDismiss: loadPhoto, content: { PhotoPicker(selectedPicture: $selectedPicture)
                    
                })
                Spacer()
                Text(profilePicture == nil ? "Click Plus to Upload Your Picture" : "Great! Tap below to continue")
                    .font(Font.custom("Cormorant-Regular", size: 22))
                    .foregroundColor(Color("champagne_button"))
                
                if let selectedPicture = selectedPicture {
                    Button(action: {
                        viewModel.uploadProfilePhoto(selectedPicture) }, label: {
                            Text("Continue")
                                .font(Font.custom("Cormorant-Bold", size: 20))
                                .foregroundColor(Color("Background_color"))
                                .frame(width: 340, height: 50)
                                .background(Color("champagne_button"))
                                .clipShape(Capsule())
                                .padding()
                        }) .padding(.top, 24)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                }
                Spacer()
            }.navigationBarHidden(true)
        }
    }
}

private struct ProfilePhotoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 190, height: 140)
        
    }
}

extension ProfilePhotoSelectorView {
    func loadPhoto() {
        
        guard let selectedPicture = selectedPicture else {return}
        profilePicture = Image(uiImage: selectedPicture)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


