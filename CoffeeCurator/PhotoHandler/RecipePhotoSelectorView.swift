//
//  RecipePhotoSelectorView.swift
//  CoffeeCurator
//
//  Created by Nataliya Durdyeva on 8/10/22.
//

import Foundation

import SwiftUI

struct RecipePhotoSelectorView: View {
    @EnvironmentObject var viewModel: CoffeeCuratorsViewModel
    @State var isShowingPhotoPicker = false
    @State var selectedPicture: UIImage?
    @State var beveragePicture: Image?
    let recipe: Recipe?
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        ZStack{
            Color("Background_color")
                .ignoresSafeArea(.all)
            VStack{
                Spacer()
                Text("Let's upload your beverage picture!")
                    .font(Font.custom("Cormorant-Medium", size: 28))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("champagne_button"))
                Spacer()
                
                Button(action: { isShowingPhotoPicker.toggle() }, label: {
                    ZStack {
                        if let beveragePicture = beveragePicture {
                            beveragePicture
                                .resizable()
                                .modifier(BeveragePhotoModifier())
                        } else {
                            Image(systemName: "plus")
                                .foregroundColor(Color("champagne_button"))
                                .modifier(BeveragePhotoModifier())
                        }
                    }
                })
                .sheet(isPresented: $isShowingPhotoPicker, onDismiss: loadBeveragePhoto, content: { PhotoPicker(selectedPicture: $selectedPicture)
                    
                })
                Spacer()
                Text(beveragePicture == nil ? "Click Plus to Upload Your Picture" : "Great! Tap below to continue")
                    .font(Font.custom("Cormorant-Regular", size: 22))
                    .foregroundColor(Color("champagne_button"))
                
                if let selectedPicture = selectedPicture {
                    Button(action: {
                        
                        viewModel.uploadBeveragePhoto(selectedPicture)
                        
                        dismiss()
                    }, label: {
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
            }.navigationBarHidden(true)
        }
    }
}

private struct BeveragePhotoModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 190, height: 140)
        
    }
}

extension RecipePhotoSelectorView {
    func loadBeveragePhoto() {
        
        guard let selectedPicture = selectedPicture else {return}
        beveragePicture = Image(uiImage: selectedPicture)
    }
}



