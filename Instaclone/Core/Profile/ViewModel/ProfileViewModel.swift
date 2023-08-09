//
//  ProfileViewModel.swift
//  Instaclone
//
//  Created by Or Israeli on 09/08/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
	
	func signOut() {
		AuthService.shared.signOut()
	}
}
