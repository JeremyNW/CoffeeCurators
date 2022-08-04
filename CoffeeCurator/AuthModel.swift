//
//  AuthModel.swift
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

class AuthViewModel: NSObject, ObservableObject {
    
    
    @Published var didRegister = false
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var userSession: FirebaseAuth.User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    
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
                                  "userName": userName.lowercased()]
                      
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
