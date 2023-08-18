//
//  FeedViewModel.swift
//  Instaclone
//
//  Created by Or Israeli on 18/08/2023.
//

import Firebase
import Foundation

class FeedViewModel: ObservableObject {
	@Published var posts = [Post]()
	
	init() {
		Task {
			try await fetchPosts()
		}
	}
	
	@MainActor
	func fetchPosts() async throws {
		let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
		self.posts = try snapshot.documents.compactMap { try $0.data(as: Post.self ) }
		
		for i in 0 ..< posts.count {
			let post = posts[i]
			let ownerUserID = post.ownerID
			let postUser = try await UserService.fetchUser(withID: ownerUserID)
			
			posts[i].user = postUser
		}
	}
}
