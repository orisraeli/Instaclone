//
//  EditProfileView.swift
//  Instaclone
//
//  Created by Or Israeli on 10/08/2023.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
	@StateObject var viewModel = EditProfileViewModel()
	@Environment(\.dismiss) var dismiss
	
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
					//TODO: add button action
					print("update profile info")
				} label: {
					Text("Done")
						.font(.subheadline)
						.fontWeight(.bold)
				}
			}
			.padding()
			
			Divider()
			
			//edit profile pic
			PhotosPicker(selection: $viewModel.selectedImage) {
				Image(systemName: "person")
					.resizable()
					.frame(width: 80, height: 80)
			}
			
			//edit profile info
			
		}
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
