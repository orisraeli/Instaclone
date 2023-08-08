//
//  PostsGridView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct PostsGridView: View {
	var posts: [Post]
	
	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 1),
		GridItem(.flexible(), spacing: 1),
		GridItem(.flexible(), spacing: 1)
	]
	
	private let imageDimension: CGFloat = UIScreen.main.bounds.width / 3 - 2
	
    var body: some View {
		LazyVGrid(columns: columns, spacing: 1) {
			ForEach(posts) { post in
				Image(post.imageURL)
					.resizable()
					.scaledToFill()
					.frame(width: imageDimension, height: imageDimension)
					.clipped()
			}
		}
    }
}

struct PostsGridView_Previews: PreviewProvider {
    static var previews: some View {
		PostsGridView(posts: Post.mockPosts)
    }
}
