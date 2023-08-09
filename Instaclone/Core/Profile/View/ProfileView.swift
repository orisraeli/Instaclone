//
//  ProfileView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct ProfileView: View {
	let user: User
	
	var posts: [Post] {
		Post.mockPosts.filter { $0.user?.username == user.username }
	}
	
    var body: some View {
			ScrollView {
				//header
				ProfileHeaderView(user: user)
				
				//posts grid
				PostsGridView(posts: posts)
				
			}
			.navigationTitle("Profile")
			.navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
		ProfileView(user: User.mockUsers[0])
    }
}
