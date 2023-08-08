//
//  UploadPostViewModel.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

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
	
	func loadImage(from item: PhotosPickerItem?) async {
		guard let item = item else { return }
		guard let data = try? await item.loadTransferable(type: Data.self) else { return }
		
		if let uiImage = UIImage(data: data) {
			postImage = Image(uiImage: uiImage)
		}
	}
	
	func cancelUpload() {
		caption = ""
		postImage = nil
		selectedImage = nil
	}
}
