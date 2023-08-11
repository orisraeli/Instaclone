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
	
	func loadImage(from item: PhotosPickerItem?) async {
		guard let item = item else { return }
		guard let data = try? await item.loadTransferable(type: Data.self) else { return }
		
		if let uiImage = UIImage(data: data) {
			profileImage = Image(uiImage: uiImage)
		}
	}
}
