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
            VStack{
                Text("Let's upload your profile picture!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("DarkBlue"))
                    .padding()
                
                Button(action: { isShowingPhotoPicker.toggle() }, label: {
                    ZStack {
                        if let profilePicture = profilePicture {
                            profilePicture
                                .resizable()
                                .modifier(ProfilePhotoModifier())
                        } else {
                            Text("Click Plus to Upload Your Picture")
                                .font(.largeTitle)
                                .bold()
                            Image(systemName: "plus")
                                .foregroundColor(Color("Background_color"))
//                                .renderingMode(.template)
                                .modifier(ProfilePhotoModifier())
                        }
                    }
                })
                .sheet(isPresented: $isShowingPhotoPicker, onDismiss: loadPhoto, content: { PhotoPicker(selectedPicture: $selectedPicture)
                    
                })

                Text(profilePicture == nil ? "Select a profile photo" : "Great! Tap below to continue")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                if let selectedPicture = selectedPicture {
                    Button(action: {
                        viewModel.uploadProfilePhoto(selectedPicture) }, label: {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 340, height: 50)
                                .background(Color("champagne_button"))
                                .clipShape(Capsule())
                                .padding()
                        }) .padding(.top, 24)
                                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                }
                Spacer()
            }
               
            
        
        
    }
}

private struct ProfilePhotoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 190, height: 140)
//            .clipShape(Circle())
        
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


