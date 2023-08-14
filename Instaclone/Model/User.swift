//
//  User.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import Firebase
import Foundation

struct User: Identifiable, Codable, Hashable {
	let id: String
	let email: String
	var username: String
	var profileImageURL: String?
	var fullName: String?
	var bio: String?
	
	var isCurrentUser: Bool {
		guard let currentUserID = Auth.auth().currentUser?.uid else { return false }
		
		return currentUserID == id
	}
}

extension User {
	static var mockUsers: [User] = [
		User(id: UUID().uuidString,
			 email: "batman@gmail.com",
			 username: "batman77",
			 profileImageURL: nil,
			 fullName: "Bruce Wayne",
			 bio: "Gotham's best. A Dark knight."),
		
		User(id: UUID().uuidString,
			 email: "venom@gmail.com",
			 username: "v3n0m",
			 profileImageURL: nil,
			 fullName: "Eddie Brock",
			 bio: "A failed reporter bonded to an alien entity, one of many symbiotes who have invaded Earth."),
		
		User(id: UUID().uuidString,
			 email: "ironman@gmail.com",
			 username: "TheRealIronman",
			 profileImageURL: nil,
			 fullName: "Tony Stark",
			 bio: "Genius. Billionaire. Playboy. Philanthropist."),
		
		User(id: UUID().uuidString,
			 email: "black.panther@gmail.com",
			 username: "black.panther",
			 profileImageURL: nil,
			 fullName: nil,
			 bio: "Wakanda Forever!"),
		
		User(id: UUID().uuidString,
			 email: "parkerp@gmail.com",
			 username: "spiderman91",
			 profileImageURL: nil,
			 fullName: "Peter Parker",
			 bio: "Teenage science whiz. Fights crime and dreaming of becoming an Avenger")
	]
}
