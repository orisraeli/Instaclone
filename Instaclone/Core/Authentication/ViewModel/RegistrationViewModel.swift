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
	
	func register() async throws {
		try await AuthService.shared.createUser(email: email, password: password, username: username)
	}
}
