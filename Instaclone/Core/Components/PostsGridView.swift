//
//  PostsGridView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import Kingfisher
import SwiftUI

struct PostsGridView: View {
	@StateObject var viewModel: PostsGridViewModel
	
	init(user: User) {
		self._viewModel = StateObject(wrappedValue: PostsGridViewModel(user: user))
	}
	
	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 1),
		GridItem(.flexible(), spacing: 1),
		GridItem(.flexible(), spacing: 1)
	]
	
	private let imageDimension: CGFloat = UIScreen.main.bounds.width / 3 - 2
	
    var body: some View {
		LazyVGrid(columns: columns, spacing: 1) {
			ForEach(viewModel.posts) { post in
				KFImage(URL(string: post.imageURL))
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
		PostsGridView(user: User.mockUsers[0])
    }
}
