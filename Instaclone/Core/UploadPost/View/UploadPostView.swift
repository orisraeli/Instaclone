//
//  UploadPostView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {
	@StateObject var viewModel = UploadPostViewModel()
	@Binding var selectedTab: Int
	
    var body: some View {
		VStack {
			//action toolbar
			HStack {
				//cancel button
				Button {
					selectedTab = 0
					viewModel.clearUploadData()
				} label: {
					Text("Cancel")
				}
				
				Spacer()
				
				//nav bar title
				Text("New Post")
					.fontWeight(.semibold)
				
				Spacer()

				//upload button
				Button {
					print("Tapped Upload Post button")
					
					Task {
						try await viewModel.uploadPost(caption: viewModel.caption)
						
						selectedTab = 0
						viewModel.clearUploadData()
					}
				} label: {
					Text("Upload")
						.fontWeight(.semibold)
				}
			}
			.padding()
						
			//post image & caption
			HStack {
				if let image = viewModel.postImage {
					image
						.resizable()
						.scaledToFill()
						.frame(width: 100, height: 100)
						.clipped()

				}
				
				TextField("caption this post...", text: $viewModel.caption, axis: .vertical)
					.textInputAutocapitalization(.never)
			}
			.padding()
			
			Spacer()
		}
		.photosPicker(isPresented: $viewModel.presentingPhotosPicker, selection: $viewModel.selectedImage)
		.onAppear {
			viewModel.presentingPhotosPicker = true
		}
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
		UploadPostView(selectedTab: .constant(0))
    }
}
