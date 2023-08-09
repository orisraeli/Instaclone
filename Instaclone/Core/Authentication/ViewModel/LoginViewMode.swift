//
//  LoginViewMode.swift
//  Instaclone
//
//  Created by Or Israeli on 09/08/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	
	func login() async throws {
		try await AuthService.shared.login(withEmail: email, password: password)
	}
}
