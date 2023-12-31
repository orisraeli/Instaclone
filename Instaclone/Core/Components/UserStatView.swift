//
//  UserStatView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct UserStatView: View {
	let value: Int
	let title: String
	
	var body: some View {
		VStack {
			Text(String(value))
				.font(.subheadline)
				.fontWeight(.semibold)
			
			Text(title)
				.font(.footnote)
			
		}
	}
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 12, title: "Posts")
    }
}
