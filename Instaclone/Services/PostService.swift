//
//  PostService.swift
//  Instaclone
//
//  Created by Or Israeli on 18/08/2023.
//

import Firebase
import Foundation

struct PostService {
	private static let collection = Firestore.firestore().collection("posts")
	
	static func fetchFeedPosts() async throws -> [Post] {
		let snapshot = try await collection.getDocuments()
		var posts = try snapshot.documents.compactMap { try $0.data(as: Post.self ) }
		
		for i in 0 ..< posts.count {
			let post = posts[i]
			let ownerUserID = post.ownerID
			let postUser = try await UserService.fetchUser(withID: ownerUserID)
			
			posts[i].user = postUser
		}
		
		return posts
	}
	
	static func fetchUserPosts(withID userID: String) async throws -> [Post] {
		let snapshot = try await collection.whereField("ownerID", isEqualTo: userID).getDocuments()
		
		return try snapshot.documents.compactMap { try $0.data(as: Post.self ) }
	}
}
