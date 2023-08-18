//
//  FeedView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct FeedView: View {
	@StateObject var viewModel = FeedViewModel()
	
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack(spacing: 32) {
					ForEach(viewModel.posts) { post in
						FeedCell(post: post)
					}
				}
				.padding(.top)
			}
			.navigationTitle("Feed")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				//logo
				ToolbarItem(placement: .navigationBarLeading) {
					Image("instagram-black")
						.resizable()
						.frame(width: 100, height: 32)
				}
				
				//chat button
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						//TODO: add button action
						
					} label: {
						Label("Chat", systemImage: "paperplane")
							.foregroundColor(.black)
					}
				}
			}
		}
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
