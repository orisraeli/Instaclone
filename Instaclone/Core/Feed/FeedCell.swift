//
//  FeedCell.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
		VStack {
			//profile image, username
			HStack {
				Image("batman-2")
					.resizable()
					.scaledToFill()
					.frame(width: 40, height: 40)
					.clipShape(Circle())
				
				Text("batman77")
					.font(.footnote)
					.fontWeight(.semibold)
				
				Spacer()
			}
			.padding(.horizontal)
			
			//post image
			Image("batman-2")
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
			Text("23 likes")
				.font(.footnote)
				.fontWeight(.semibold)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.horizontal)
				.padding(.top, 1)
			
			//caption label
			HStack {
				Text("batman77")
					.fontWeight(.semibold) +
				Text(" ") +
				Text("This is a post caption")
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal)
			.padding(.top, 1)
			
			//timestamp label
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
        FeedCell()
    }
}
