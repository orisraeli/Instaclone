//
//  ProfileHeaderView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
	let user: User
	
    var body: some View {
		VStack(spacing: 10) {
			//profile picture, stats
			HStack {
				Image(user.profileImageURL ?? "")
					.resizable()
					.scaledToFill()
					.frame(width: 80, height: 80)
					.clipShape(Circle())
				
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
				
				Text(user.username)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal)
			
			//edit profile button
			Button {
				//TODO: add button action
				
			} label: {
				Text("Edit Profile")
					.font(.subheadline)
					.fontWeight(.semibold)
					.frame(width: 360, height: 32)
					.foregroundColor(.black)
					.overlay {
						RoundedRectangle(cornerRadius: 6)
							.stroke(.gray, lineWidth: 1)
					}
			}
			
			Divider()
		}
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.mockUsers[0])
    }
}
