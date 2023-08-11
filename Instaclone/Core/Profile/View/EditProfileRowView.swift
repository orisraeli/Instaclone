//
//  EditProfileRowView.swift
//  Instaclone
//
//  Created by Or Israeli on 11/08/2023.
//

import SwiftUI

struct EditProfileRowView: View {
	let title: String
	let placeholder: String

	@Binding var text: String
	
    var body: some View {
		HStack {
			Text(title)
				.padding(.leading, 8)
				.frame(width: 100, alignment: .topLeading)
			
			VStack {
				TextField(placeholder, text: $text)
					.offset(y: 5)
				
				Divider()
			}
			.font(.subheadline)
			.frame(height: 36)
		}
    }
}

struct EditProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
		EditProfileRowView(title: "Name", placeholder: "Enter your full name", text: .constant("Peter Parker"))
    }
}
