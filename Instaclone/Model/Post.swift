//
//  Post.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
	let id: String
	let ownerID: String
	let caption: String
	var likes: Int
	let imageURL: String
	let timestamp: Date
	let user: User?
}

extension Post {
	static var mockPosts: [Post] = [
		Post(id: UUID().uuidString,
			 ownerID: UUID().uuidString,
			 caption: "lorem ipsum dolor",
			 likes: 123,
			 imageURL: "batman-1",
			 timestamp: Date.now,
			 user: User.mockUsers[0]),
		
		Post(id: UUID().uuidString,
			 ownerID: UUID().uuidString,
			 caption: "Wakanda Forever",
			 likes: 6,
			 imageURL: "blackpanther-1",
			 timestamp: Date.now,
			 user: User.mockUsers[3]),
		
		Post(id: UUID().uuidString,
			 ownerID: UUID().uuidString,
			 caption: "I am Iron-Man",
			 likes: 10573,
			 imageURL: "ironman-1",
			 timestamp: Date.now,
			 user: User.mockUsers[2]),
		
		Post(id: UUID().uuidString,
			 ownerID: UUID().uuidString,
			 caption: "Venom is hungry. Time to eat.",
			 likes: 666,
			 imageURL: "venom-1",
			 timestamp: Date.now,
			 user: User.mockUsers[1]),
		
		Post(id: UUID().uuidString,
			 ownerID: UUID().uuidString,
			 caption: "lorem ipsum dolor",
			 likes: 45871,
			 imageURL: "venom-2",
			 timestamp: Date.now,
			 user: User.mockUsers[1])
	]
}
