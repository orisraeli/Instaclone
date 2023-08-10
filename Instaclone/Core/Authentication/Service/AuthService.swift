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
	@Published var currentUser: User?
	
	static let shared = AuthService()
	
	init() {
		Task {
			try await loadUserData()
		}
	}
	
	@MainActor
	func login(withEmail email: String, password: String) async throws {
		print("Logging in for user -  email: \(email), password: \(password)")
		
		do {
			let result = try await Auth.auth().signIn(withEmail: email, password: password)
			self.userSession = result.user
			try await loadUserData()
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
	
	@MainActor
	func loadUserData() async throws {
		self.userSession = Auth.auth().currentUser
		guard let currentUserID = self.userSession?.uid else { return }
		
		let snapshot = try await Firestore.firestore().collection("users").document(currentUserID).getDocument()
		print("Snapshot document data: \(String(describing: snapshot.data()))")
		
		self.currentUser = try? snapshot.data(as: User.self)
	}
	
	func signOut() {
		print("Signing out current user.")
		try? Auth.auth().signOut()
		self.userSession = nil
		self.currentUser = nil
	}
	
	private func uploadUserData(for userID: String, email: String, username: String) async {
		print("Uploading user data.")
		let user = User(id: userID, email: email, username: username)
		self.currentUser = user
		
		guard let encoded = try? Firestore.Encoder().encode(user) else { return }
		
		try? await Firestore.firestore().collection("users").document(user.id).setData(encoded)
	}
}
