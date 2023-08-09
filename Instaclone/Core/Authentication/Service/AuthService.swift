//
//  AuthService.swift
//  Instaclone
//
//  Created by Or Israeli on 09/08/2023.
//

import FirebaseAuth
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
}
