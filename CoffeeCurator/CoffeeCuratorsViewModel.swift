//
//  CoffeeCuratorsViewModel.swift
//  CoffeeCurator
//
//  Created by Nataliya Durdyeva on 8/4/22.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

class CoffeeCuratorsViewModel: NSObject, ObservableObject {
    
    @Published var recipes = [Recipe]()

        func addRecipe(coffeeName: String, directions: String) {
    
            let db = Firestore.firestore()
    
            db.collection("recipe").addDocument(data: [
                "coffeeName": coffeeName,
                "directions": directions
                
            ])
        }
    
    
    func fetchRecipes() {
        let db = Firestore.firestore()
            db.collection("recipe").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No recipes")
                    return
                }
               

                self.recipes = documents.map { (queryDocumentSnapshot) -> Recipe in
                   
                    let data = queryDocumentSnapshot.data()
                    let id = data["id"] as? String ?? ""
                    let coffeeName = data["coffeeName"] as? String ?? ""
                    let directions = data["directions"] as? String ?? ""
                    
                    return Recipe(id: id, coffeeName: coffeeName, directions: directions)
            }
    }
    }
    
//    func delete(at offsets: IndexSet) {
//        let db = Firestore.firestore()
//      offsets.map { recipes[$0] }.forEach { recipe in
//        guard let recipeID = recipe.id else { return }
//        db.collection("recipe").document(recipeID).delete() { err in
//          if let err = err {
//            print("Error removing document: \(err)")
//          } else {
//            print("Document successfully removed!")
//          }
//        }
//      }
//    }

}
        
