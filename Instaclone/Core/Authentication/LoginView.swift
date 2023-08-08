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
				Spacer()
				
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
						.frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
					
					Text("OR")
						.font(.footnote)
						.fontWeight(.semibold)
					
					Rectangle()
						.frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
				}
				.foregroundColor(.gray)
				
				HStack {
					Image("facebook_logo_small")
						.resizable()
						.frame(width: 32, height: 32)
					
					Text("Continue with Facebook")
						.font(.footnote)
						.fontWeight(.semibold)
						.foregroundColor(.blue)
				}
				.padding(.top, 8)

				Spacer()
				
				Divider()
				
				NavigationLink {
					Text("Sign Up")
				} label: {
					HStack(spacing: 3) {
						Text("Don't have an account?")
						
						Text("Sign Up")
							.fontWeight(.semibold)
					}
				}
				.font(.footnote)
				.padding()
			}
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
