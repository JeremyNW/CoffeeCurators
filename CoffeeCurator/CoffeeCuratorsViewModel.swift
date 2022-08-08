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
    
    @Published var didRegister = false
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var userSession: FirebaseAuth.User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = CoffeeCuratorsViewModel()

        func addRecipe(coffeeName: String, directions: String) {
    
            let db = Firestore.firestore()
    
            db.collection("recipe").addDocument(data: [
                "coffeeName": coffeeName,
                "directions": directions,
                
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
                    
                    return Recipe(coffeeName: coffeeName, directions: directions)
            }
    }
    }
    
    func signUp(email: String, password: String, userName: String) {
        
        let auth = Auth.auth()
        
        auth.createUser(withEmail: email, password: password) {
            result, error in
            if let error = error {
                print("*********Failed to create user:", error)
                return
            }
            
                      guard let user = result?.user else {return}
            self.tempCurrentUser = user
            

            let data: [String: Any] = ["email": email,
                                  "userName": userName.lowercased(),
                                       "uid": user.uid]
                      
            Firestore.firestore().collection("users").document(user.uid)
                .setData(data) { _ in
              
                    self.didAuthenticateUser = true
                    self.didRegister = true
                }
        }
        
    }
       
    func signIn(email: String, password: String) {
        
        let auth = Auth.auth()
       
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                        return
                    }
            
            guard let user = result?.user else { return }
            self?.userSession = user
//            self?.fetchUser()
            
        }
    }
    
    func uploadProfilePhoto(_ profilePicture: UIImage) {
        
        
        guard let uid = tempCurrentUser?.uid else {return}
        
        PhotoUploader.uploadPhoto(image: profilePicture) { profilePictureUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profilePictureUrl": profilePictureUrl]) { _ in
                    self.userSession = self.tempCurrentUser
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
        
        UserService.fetchUser(withUid: uid) {user in
            
            self.currentUser = user
        }
    }
    
    struct UserService {
        
        static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
            Firestore.firestore().collection("users")
                .document(uid)
                .getDocument { snapshot, _ in
                guard let user = try? snapshot?.data(as: User.self) else {
                    print("Failed to Fetch user....")
                    
                    return
                    
                }
                completion(user)
            }
        }
    }
    
    
//    func fetchUser() {
//        guard let uid = self.userSession?.uid else {return}
//
//        UserService.fetchUser(withUid: uid) {user in
//
//            self.currentUser = user
//        }
//    }
//
//    struct UserService {
//
//        static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
//            Firestore.firestore().collection("users")
//                .document(uid)
//                .getDocument { snapshot, _ in
//                guard let user = try? snapshot?.data(as: User.self) else { return }
//                completion(user)
//            }
//        }
//    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
}
    
//    func delete(indexSet: IndexSet, completion: ((Bool) -> Void)?) {
//        let db = Firestore.firestore()
//        let recipeToDelete = db.collection("recipe").document(recipe.id!)
//        recipeToDelete.delete() { error in
//            if let error = error {
//                print("Error removing recipe from Firebase \(error)")
//            } else {
//
//              completion?(true)
//            }
//
//
//
//        }
//
//
//         }
    
    
//    func deleteData(recipeToDelete: Recipe) {
//        let db = Firestore.firestore()
//        db.collection("recipes").document(recipeToDelete.id!).delete { error in
//
//            if error == nil {
//
//                DispatchQueue.main.async {
//
//                    self.recipes.removeAll { recipe in
//
//                    return recipe.id == recipeToDelete.id
//                }
//                }
//            }
//        }
//    }


        
