//
//  AuthService.swift
//  Instaclone
//
//  Created by Or Israeli on 09/08/2023.
//

import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import Foundation

class AuthService {
	@Published var userSession: FirebaseAuth.User?
	
	static let shared = AuthService()
	
	init() {
		self.userSession = Auth.auth().currentUser
	}
	
	@MainActor
	func login(withEmail email: String, password: String) async throws {
		print("Logging in for user -  email: \(email), password: \(password)")
		
		do {
			let result = try await Auth.auth().signIn(withEmail: email, password: password)
			self.userSession = result.user
		} catch {
			print("Failed to log in user with error: \(error.localizedDescription)")
		}
	}
	
	@MainActor
	func createUser(email: String, password: String, username: String) async throws {
		print("Creating user with - email: \(email), password: \(password), username: \(username)")
		
		do {
			let result = try await Auth.auth().createUser(withEmail: email, password: password)
			self.userSession = result.user
			await uploadUserData(for: result.user.uid, email: email, username: username)
		} catch {
			print("Failed to register user with error: \(error.localizedDescription)")
		}
	}
	
	func loadUserData() async throws {
		
	}
	
	func signOut() {
		print("Signing out current user.")
		try? Auth.auth().signOut()
		self.userSession = nil
	}
	
	private func uploadUserData(for userID: String, email: String, username: String) async {
		print("Uploading user data.")
		let user = User(id: userID, email: email, username: username)
		guard let encoded = try? Firestore.Encoder().encode(user) else { return }
		
		try? await Firestore.firestore().collection("users").document(user.id).setData(encoded)
	}
}
