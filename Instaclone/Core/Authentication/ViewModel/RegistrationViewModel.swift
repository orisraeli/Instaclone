//
//  RegistrationViewModel.swift
//  Instaclone
//
//  Created by Or Israeli on 09/08/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
	@Published var email = ""
	@Published var username = ""
	@Published var password = ""
	@Published var presentErrorMessage = false
	
	func register() async throws {
		do {
			try await AuthService.shared.createUser(email: email, password: password, username: username)
		} catch {
			print("error in sign up")
			presentErrorMessage = true
		}
	}
	
	func cleanup() {
		email = ""
		username = ""
		password = ""
	}
}
