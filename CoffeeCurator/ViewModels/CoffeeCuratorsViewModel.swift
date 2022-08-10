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

    @Published var users = [User]()
    @Published var didRegister = false
    @Published var isFavorite = false
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var userSession: FirebaseAuth.User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    let db = Firestore.firestore()
    static let shared = CoffeeCuratorsViewModel()
    
    override init() {
        super.init()
    
   
        tempCurrentUser = nil
        userSession = Auth.auth().currentUser
        fetchUser()
       
    }

    
    //MARK: FUNCTIONS FOR RECIPES
    
//        func addRecipe(coffeeName: String, directions: String) {
//            guard let uid = Auth.auth().currentUser?.uid else { return }
//            
//
//            let data: [String: Any] = [
//                
//
//                "coffeeName": coffeeName,
//                "directions": directions,
//                "isFavorite": false
//            ]
//            
//            db.collection("recipe").document(uid).setData(data)
//        }
    

//    func fetchRecipes() {
//        db.collection("recipe").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No recipes")
//                return
//            }
//
//            self.recipes = documents.map { (queryDocumentSnapshot) -> Recipe in
//                let data = queryDocumentSnapshot.data()
//                let id = queryDocumentSnapshot.documentID
//                let coffeeName = data["coffeeName"] as? String ?? ""
//                let directions = data["directions"] as? String ?? ""
//                let isFavorite = data["isFavorite"] as? Bool ?? false
//                return Recipe(id: id, coffeeName: coffeeName, directions: directions, isFavorite: isFavorite)
//            }
//        }
//    }
    func addRecipe(coffeeName: String, directions: String) {
                guard let userID = Auth.auth().currentUser?.uid else { return }


                let data: [String: Any] = [


                    "coffeeName": coffeeName,
                    "directions": directions,
                    "isFavorite": false,
                    "userID": userID
                ]

                db.collection("recipe").document().setData(data)
            }


        func fetchRecipes() {
            db.collection("recipe").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No recipes")
                    return
                }

                self.recipes = documents.map { (queryDocumentSnapshot) -> Recipe in
                    let data = queryDocumentSnapshot.data()
                    let id = queryDocumentSnapshot.documentID
                    let coffeeName = data["coffeeName"] as? String ?? ""
                    let directions = data["directions"] as? String ?? ""
                    let isFavorite = data["isFavorite"] as? Bool ?? false
                    let userID = data["userID"] as? String ?? ""
                    return Recipe(id: id, coffeeName: coffeeName, directions: directions, isFavorite: isFavorite, userID: userID)
                }
            }
        }
    //MARK: LIKE?DISLIKE FUNCTIONS
    
    
    func likeRecipe(_ recipe: Recipe, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let recipeId = recipe.id else { return }
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("recipe").document(recipeId)
            .updateData(["isFavorite": recipe.isFavorite ?? true]) { _ in
                userLikesRef.document(recipeId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func unlikeRecipe(_ recipe: Recipe, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let recipeId = recipe.id else { return }
   
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("recipe").document(recipeId)
            .updateData(["isFavorite": recipe.isFavorite ?? false]) { _ in
                userLikesRef.document(recipeId).delete { _ in
                    completion()
                }
            }
    }
    
//    func likeRecipe(reccipe: Recipe) {
//
////        let recipes: Recipe
////        var isFavorite: Bool? = false
//
//        likeRecipe(recipe) {
//            self.recipe.isFavorite = true
//        }
//
//    }
//
//
//    func unlikeRecipe() {
//
//        unlikeRecipe(recipe) {
//            self.recipe.isFavorite = false
//        }
//
//    }
//
   
    
    
    
    func updateRecipe(_ offsets: IndexSet, coffeeName: String, directions: String) {

        let data: [String: Any] = [
        
            "coffeeName": coffeeName,
            "directions": directions,
    
        ]
        offsets.map { recipes[$0] }.forEach { recipe in
            guard let recipeID = recipe.id else { return }
            
            let docUpdate = db.collection("users")
                .document(recipeID)
           
            docUpdate.updateData(data)
       
//        { error in
//                if let error = error {
//                    print("Error updating document: \(error)")
//                } else {
//                    print("Document successfully updated!")
//                }
//        }
    }
    }
    
    //*************************************
    
    //MARK: FUNCTIONS FOR USERS
    
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
            self?.fetchUser()
            
        }
    }
    
    func fetchUserData() {
        let db = Firestore.firestore()
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.users = documents.map { (queryDocumentSnapshot) -> User in
                
                let data = queryDocumentSnapshot.data()
                let id = data["uid"] as? String ?? ""
                let userName = data["userName"] as? String ?? ""
                let profilePictureUrl = data["profilePictureUrl"] as? String ?? ""
                return User(id: id, userName: userName, profilePictureUrl: profilePictureUrl)
            }
        }
    }
    
    
    //*************************************
    
    
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
    
    func delete(_ offsets: IndexSet) {
        offsets.map { recipes[$0] }.forEach { recipe in
            guard let recipeID = recipe.id else { return }
            db.collection("recipe").document(recipeID).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
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
