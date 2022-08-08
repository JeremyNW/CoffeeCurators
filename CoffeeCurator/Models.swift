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



struct Recipe: Codable, Identifiable, Hashable {
    
    @DocumentID var id: String? 
    var coffeeName: String
//    var ingredients: String
    var directions: String
//    var isFavorite: Bool = false
//    var imageURL: String
//    var userName: String
//    var userImage: String
}


struct User: Codable, Identifiable {
   
    var id: String
   // @DocumentID var id: String?
    var userName: String
    var userImage: String
    
}
