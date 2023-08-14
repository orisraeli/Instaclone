//
//  ProfileHeaderView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
	let user: User
	
	@StateObject var viewModel = ProfileViewModel()
	
    var body: some View {
		VStack(spacing: 10) {
			//profile picture, stats
			HStack {
				CircularProfileImageView(user: user, size: .large)
				
				Spacer()
				
				HStack(spacing: 8) {
					UserStatView(value: 3, title: "Posts")
						.frame(width: 80)
					
					UserStatView(value: 76, title: "Followers")
						.frame(width: 80)
					
					UserStatView(value: 42, title: "Following")
						.frame(width: 80)
					
				}
			}
			.padding(.horizontal)
			
			//username, bio
			VStack(alignment: .leading, spacing: 4) {
				if let fullName = user.fullName {
					Text(fullName)
						.font(.footnote)
						.fontWeight(.semibold)
				}
				
				Text(user.bio ?? "No Bio")
					.font(.footnote)
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal)
			
			//action button
			Button {
				//TODO: add button action
				if user.isCurrentUser {
					print("tapped edit profile")
					viewModel.presentingEditProfileView = true
				} else {
					print("tapped follow")
				}
			} label: {
				Text(user.isCurrentUser ? "Edit Profile" : "Follow")
					.font(.subheadline)
					.fontWeight(.semibold)
					.frame(width: 360, height: 32)
					.background(user.isCurrentUser ? .white : .blue)
					.foregroundColor(user.isCurrentUser ? .black : .white)
					.cornerRadius(6)
					.overlay {
						RoundedRectangle(cornerRadius: 6)
							.stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
					}
			}
			
			Divider()
		}
		.fullScreenCover(isPresented: $viewModel.presentingEditProfileView) {
			EditProfileView(user: user)
		}
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.mockUsers[0])
    }
}
