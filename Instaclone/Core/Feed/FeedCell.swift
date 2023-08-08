//
//  FeedCell.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct FeedCell: View {
	let post: Post
	
    var body: some View {
		VStack {
			//profile image, username
			if let user = post.user {
				PostHeaderView(username: user.username, profileImageURL: user.profileImageURL)
			}
			
			//post image
			Image(post.imageURL)
				.resizable()
				.scaledToFill()
				.frame(height: 400)
				.clipShape(Rectangle())
			
			//action buttons
			HStack(spacing: 16) {
				Button {
					//TODO: add button action
					print("like post")
				} label: {
					Label("Like", systemImage: "heart")
						.labelStyle(.iconOnly)
						.imageScale(.large)
				}
				
				Button {
					//TODO: add button action
					print("comment on post")
				} label: {
					Label("Comments", systemImage: "bubble.right")
						.labelStyle(.iconOnly)
						.imageScale(.large)
				}
				
				Button {
					//TODO: add button action
					print("share post")
				} label: {
					Label("Share", systemImage: "paperplane")
						.labelStyle(.iconOnly)
						.imageScale(.large)
				}
				
				Spacer()
			}
			.padding(.leading)
			.foregroundColor(.black)
			
			//likes label
			Text("\(post.likes) likes")
				.font(.footnote)
				.fontWeight(.semibold)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.horizontal)
				.padding(.top, 1)
			
			//caption label
			HStack {
				Text(post.user?.username ?? "")
					.fontWeight(.semibold) +
				Text(" ") +
				Text(post.caption)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal)
			.padding(.top, 1)
			
			//timestamp label
			//TODO: replace label
			Text("6h ago")
				.font(.footnote)
				.foregroundColor(.gray)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.horizontal)
				.padding(.top, 1)
		}
    }
	
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
		FeedCell(post: Post.mockPosts[0])
    }
}
