//
//  UploadPostViewModel.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import Firebase
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
	@Published var caption = ""
	@Published var presentingPhotosPicker = false
	@Published var postImage: Image?
	
	@Published var selectedImage: PhotosPickerItem? {
		didSet {
			Task {
				await loadImage(from: selectedImage)
			}
		}
	}
	
	private var uiImage: UIImage?
	
	func loadImage(from item: PhotosPickerItem?) async {
		guard let item = item else { return }
		guard let data = try? await item.loadTransferable(type: Data.self) else { return }
		
		if let uiImage = UIImage(data: data) {
			self.uiImage = uiImage
			postImage = Image(uiImage: uiImage)
		}
	}
	
	func clearUploadData() {
		caption = ""
		postImage = nil
		selectedImage = nil
		uiImage = nil
	}
	
	func uploadPost(caption: String) async throws {
		guard let currentUserUUID = Auth.auth().currentUser?.uid else { return }
		guard let uiImage = uiImage else { return }
		guard let imageURL = try await ImageUploader.uploadImage(uiImage) else { return }
		
		let postReference = Firestore.firestore().collection("posts").document()
		let post = Post(id: postReference.documentID, ownerID: currentUserUUID, caption: caption, likes: 0, imageURL: imageURL, timestamp: Timestamp())
		
		do {
			let encoded = try Firestore.Encoder().encode(post)
			try await postReference.setData(encoded)
			print("Finished uploading post.")
		} catch {
			print("Failed to upload post: \(error.localizedDescription).")
		}
		
	}
}
