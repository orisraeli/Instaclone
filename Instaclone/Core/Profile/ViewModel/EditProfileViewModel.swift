//
//  EditProfileViewModel.swift
//  Instaclone
//
//  Created by Or Israeli on 10/08/2023.
//

import Firebase
import PhotosUI
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
	@Published var user: User
	
	@Published var fullName = ""
	@Published var bio = ""
	@Published var profileImage: Image?
	@Published var selectedImage: PhotosPickerItem? {
		didSet {
			Task {
				await loadImage(from: selectedImage)
			}
		}
	}
	
	init(user: User) {
		self.user = user
	}
	
	func loadImage(from item: PhotosPickerItem?) async {
		guard let item = item else { return }
		guard let data = try? await item.loadTransferable(type: Data.self) else { return }
		
		if let uiImage = UIImage(data: data) {
			profileImage = Image(uiImage: uiImage)
		}
	}
	
	func updateUserData() async throws {
		var data = [String: Any]()
		
		//update profile image if changed
		
		//update name & bio if changed
		if !fullName.isEmpty && user.fullName != fullName {
			print("Updating user full name: \(fullName)")
			data["fullName"] = fullName
		}
		
		if !bio.isEmpty && user.bio != bio {
			print("Updating user bio: \(bio)")
			data["bio"] = bio
		}
		
		if !data.isEmpty {
			try await Firestore.firestore().collection("users").document(user.id).updateData(data)
			print("Finished updating user data.")
		}
	}
}
