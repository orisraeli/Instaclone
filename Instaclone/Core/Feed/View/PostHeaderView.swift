//
//  PostHeaderView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct PostHeaderView: View {
	let user: User
	
    var body: some View {
		HStack {
			CircularProfileImageView(user: user, size: .xSmall)
			
			Text(user.username)
				.font(.footnote)
				.fontWeight(.semibold)
			
			Spacer()
		}
		.padding(.horizontal)
    }
}

struct PostHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		PostHeaderView(user: User.mockUsers[1])
    }
}
