//
//  UserService.swift
//  Instaclone
//
//  Created by Or Israeli on 10/08/2023.
//

import Firebase
import Foundation

struct UserService {
	static func fetchAllUsers() async throws -> [User] {
		let snapshot = try await Firestore.firestore().collection("users").getDocuments()
		return snapshot.documents.compactMap { try? $0.data(as: User.self) }
	}
	
	static func fetchUser(withID userID: String) async throws -> User {
		let snapshot = try await Firestore.firestore().collection("users").document(userID).getDocument()
		
		return try snapshot.data(as: User.self)
	}
}
