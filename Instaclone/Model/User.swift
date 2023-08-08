//
//  User.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import Foundation

struct User: Identifiable, Codable {
	let id: String
	let email: String
	var username: String
	var profileImageURL: String?
	var fullName: String?
	var bio: String?
}

extension User {
	static var mockUsers: [User] = [
		User(id: UUID().uuidString,
			 email: "batman@gmail.com",
			 username: "batman77",
			 profileImageURL: "batman-1",
			 fullName: "Bruce Wayne",
			 bio: "Gotham's best. A Dark knight."),
		
		User(id: UUID().uuidString,
			 email: "venom@gmail.com",
			 username: "v3n0m",
			 profileImageURL: "venom-2",
			 fullName: "Eddie Brock",
			 bio: "A failed reporter bonded to an alien entity, one of many symbiotes who have invaded Earth."),
		
		User(id: UUID().uuidString,
			 email: "ironman@gmail.com",
			 username: "TheRealIronman",
			 profileImageURL: "ironman-1",
			 fullName: "Tony Stark",
			 bio: "Genius. Billionaire. Playboy. Philanthropist."),
		
		User(id: UUID().uuidString,
			 email: "black.panther@gmail.com",
			 username: "black.panther",
			 profileImageURL: "blackpanther-1",
			 fullName: nil,
			 bio: "Wakanda Forever!"),
		
		User(id: UUID().uuidString,
			 email: "parkerp@gmail.com",
			 username: "spiderman91",
			 profileImageURL: "spiderman-1",
			 fullName: "Peter Parker",
			 bio: "Teenage science whiz. Fights crime and dreaming of becoming an Avenger")
	]
}
