//
//  CurrentUserProfileView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
	let user: User
	
	var posts: [Post] {
		Post.mockPosts.filter { $0.user?.username == user.username }
	}
	
	var body: some View {
		NavigationStack {
			ScrollView {
				//header
				ProfileHeaderView(user: user)
				
				//posts grid
				PostsGridView(posts: posts)
			}
			.navigationTitle("Profile")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					//menu button
					Button {
						//TODO: add button action
						
					} label: {
						Label("Menu", systemImage: "line.3.horizontal")
							.foregroundColor(.black)
					}
				}
			}
		}
	}
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
		CurrentUserProfileView(user: User.mockUsers[0])
    }
}
