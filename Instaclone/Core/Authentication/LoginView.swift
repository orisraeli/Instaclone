//
//  LoginView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct LoginView: View {
	@State private var email = ""
	@State private var password = ""
	
    var body: some View {
		NavigationStack {
			VStack {
				//logo
				Image("instagram-black")
					.resizable()
					.scaledToFit()
					.frame(width: 220, height: 100)
				
				//text fields
				VStack {
					TextField("Enter your email", text: $email)
						.font(.subheadline)
						.textInputAutocapitalization(.never)
						.keyboardType(.emailAddress)
						.padding()
						.background(Color(.systemGray6))
						.cornerRadius(10)
						.padding(.horizontal, 24)
					
					SecureField("Enter your password", text: $password)
						.font(.subheadline)
						.padding()
						.background(Color(.systemGray6))
						.cornerRadius(10)
						.padding(.horizontal, 24)
				}
				
				//forgot password button
				Button {
					print("tapped forgot password")
					//TODO: add button action
				} label: {
					Text("Forgot Password?")
						.font(.footnote)
						.fontWeight(.semibold)
						.padding(.horizontal, 28)
				}
				.frame(maxWidth: .infinity, alignment: .trailing)
				
				//login button
				Button {
					print("tapped login")
					//TODO: add button action
				} label: {
					Text("Login")
						.foregroundColor(.white)
						.font(.subheadline)
						.fontWeight(.semibold)
						.frame(width: 360, height: 44)
						.background(.blue)
						.cornerRadius(10)
				}
				.padding(.vertical)
				
				//divider
				HStack {
					Rectangle()
						
				}
			}
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
