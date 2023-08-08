//
//  PostHeaderView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct PostHeaderView: View {
	let username: String
	let profileImageURL: String?
	
    var body: some View {
		HStack {
			Image(profileImageURL ?? "")
				.resizable()
				.scaledToFill()
				.frame(width: 40, height: 40)
				.clipShape(Circle())
			
			Text(username)
				.font(.footnote)
				.fontWeight(.semibold)
			
			Spacer()
		}
		.padding(.horizontal)
    }
}

struct PostHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		PostHeaderView(username: User.mockUsers[0].username, profileImageURL: User.mockUsers[0].profileImageURL)
    }
}
