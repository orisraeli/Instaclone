//
//  AddEmailView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct AddEmailView: View {
	@EnvironmentObject var viewModel: RegistrationViewModel
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		VStack(spacing: 12) {
			Text("Add your email")
				.font(.title2).bold()
				.padding(.top)
			
			Text("You'll use this email to sign in to your account")
				.font(.footnote)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 24)
			
			TextField("email address", text: $viewModel.email)
				.textInputAutocapitalization(.never)
				.autocorrectionDisabled()
				.keyboardType(.emailAddress)
				.ICTextFieldStyle()

			//next button
			NavigationLink {
				CreateUsernameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			AddEmailView()
		}
    }
}
