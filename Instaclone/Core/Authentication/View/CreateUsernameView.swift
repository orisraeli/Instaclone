//
//  CreateUsernameView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct CreateUsernameView: View {
	@EnvironmentObject var viewModel: RegistrationViewModel
	@Environment(\.dismiss) var dismiss
		
	var body: some View {
		VStack(spacing: 12) {
			Text("Create username")
				.font(.title2).bold()
				.padding(.top)
			
			Text("Pick a username for your new account. You can always change it later.")
				.font(.footnote)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 24)
			
			TextField("username", text: $viewModel.username)
				.textInputAutocapitalization(.never)
				.autocorrectionDisabled()
				.ICTextFieldStyle()
			
			//next button
			NavigationLink {
				CreatePasswordView()
					.navigationBarBackButtonHidden()
			} label: {
				Text("Next")
					.foregroundColor(.white)
					.font(.subheadline)
					.fontWeight(.semibold)
					.frame(width: 360, height: 44)
					.background(.blue)
					.cornerRadius(10)
			}
			.padding(.vertical)
			
			Spacer()
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button {
					dismiss()
				} label: {
					Label("Back", systemImage: "chevron.left")
						.imageScale(.large)
						.tint(.black)
				}
			}
		}
	}
}

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
