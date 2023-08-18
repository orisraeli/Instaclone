//
//  ProfileView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct ProfileView: View {
	let user: User
	
    var body: some View {
			ScrollView {
				//header
				ProfileHeaderView(user: user)
				
				//posts grid
				PostsGridView(user: user)
				
			}
			.navigationTitle("Profile")
			.navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
		ProfileView(user: User.mockUsers[0])
    }
}
