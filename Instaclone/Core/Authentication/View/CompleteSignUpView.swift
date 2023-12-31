//
//  CompleteSignUpView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct CompleteSignUpView: View {
	@EnvironmentObject var viewModel: RegistrationViewModel
	@Environment(\.dismiss) var dismiss
		
	var body: some View {
		VStack(spacing: 12) {
			Spacer()
			
			Text("Welcome to Instaclone, \(viewModel.username).")
				.font(.title2.bold())
				.multilineTextAlignment(.center)
				.padding(.top)
			
			Text("Click here to complete registration and start using Instaclone")
				.font(.footnote)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 24)
			
			//next button
			Button {
				print("tapped sign up")
				Task {
					try await viewModel.register()
				}
				viewModel.cleanup()
			} label: {
				Text("Sign Up")
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
		.alert("Couldn't sign up", isPresented: $viewModel.presentErrorMessage) { }
	}
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
