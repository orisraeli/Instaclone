//
//  EditProfileView.swift
//  Instaclone
//
//  Created by Or Israeli on 10/08/2023.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
	@StateObject var viewModel: EditProfileViewModel
	@Environment(\.dismiss) var dismiss
	
	init(user: User) {
		self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
	}
	
    var body: some View {
		VStack {
			//toolbar
			HStack {
				Button("Cancel") {
					dismiss()
				}
				
				Spacer()
				
				Text("Edit Profile")
					.font(.subheadline)
					.fontWeight(.semibold)
				
				Spacer()
				
				Button {
					Task {
						try await viewModel.updateUserData()
					}
					dismiss()
				} label: {
					Text("Done")
						.font(.subheadline)
						.fontWeight(.bold)
				}
			}
			.padding(.horizontal)
			
			Divider()
			
			//edit profile pic
			PhotosPicker(selection: $viewModel.selectedImage) {
				VStack {
					if let image = viewModel.profileImage {
						image
							.resizable()
							.clipShape(Circle())
							.frame(width: 80, height: 80)
					} else {
						Image(systemName: "person")
							.resizable()
							.foregroundColor(.white)
							.background(.gray)
							.clipShape(Circle())
							.frame(width: 80, height: 80)
					}
					
					Text("Edit profile picture")
						.font(.footnote)
						.fontWeight(.semibold)
					
					Divider()
				}
			}
			.padding(.vertical, 8)
			
			//edit profile info
			VStack {
				EditProfileRowView(title: "Name", placeholder: "Enter your full name...", text: $viewModel.fullName)
				
				EditProfileRowView(title: "Bio", placeholder: "Tell people about you...", text: $viewModel.bio)
			}
			
			Spacer()
		}
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
		EditProfileView(user: User.mockUsers[0])
    }
}
