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
	
    var body: some View {
		VStack {
			//action toolbar
			HStack {
				Button {
					viewModel.cancelUpload()
				} label: {
					Text("Cancel")
				}
				
				Spacer()

				Text("New Post")
					.fontWeight(.semibold)
				
				Spacer()

				
				Button {
					print("tapped upload")
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
        UploadPostView()
    }
}
