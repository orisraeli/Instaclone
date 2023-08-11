//
//  ImageUploader.swift
//  Instaclone
//
//  Created by Or Israeli on 11/08/2023.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
	static func uploadImage(_ image: UIImage) async throws -> String? {
		guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
		
		let fileName = UUID().uuidString
		let storageRefrence = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
		
		do {
			let _ = try await storageRefrence.putDataAsync(imageData)
			let url = try await storageRefrence.downloadURL()
			return url.absoluteString
		} catch {
			print("Failed to upload image. Error: \(error.localizedDescription)")
			return nil
		}
	}
}
