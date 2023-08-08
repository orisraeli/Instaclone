//
//  CreatePasswordView.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct CreatePasswordView: View {
	@Environment(\.dismiss) var dismiss
	
	@State private var password: String = ""
	
	var body: some View {
		VStack(spacing: 12) {
			Text("Create a password")
				.font(.title2).bold()
				.padding(.top)
			
			Text("Your password must be at least 6 characters in length.")
				.font(.footnote)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 24)
			
			SecureField("password", text: $password)
				.ICTextFieldStyle()
			
			//next button
			NavigationLink {
				CompleteSignUpView()
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
