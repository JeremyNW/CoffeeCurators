//
//  Models.swift
//  CoffeeCurator
//
//  Created by Regina Paek on 8/4/22.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift



struct Recipe: Identifiable, Hashable, Decodable {
    
    @DocumentID var id: String? 
    var coffeeName: String
    var directions: String
    var isFavorite: Bool? = false
    var userID: String
    var recipePictureUrl: String
}


struct User:  Identifiable, Hashable, Decodable  {
   
//    var id: String
    @DocumentID var id: String?
    var userName: String
    var profilePictureUrl: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
