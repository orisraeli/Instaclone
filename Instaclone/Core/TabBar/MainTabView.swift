//
//  MainTabView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct MainTabView: View {
	@State private var tabIndex = 0
	
    var body: some View {
		TabView(selection: $tabIndex) {
			FeedView()
				.onAppear {
					tabIndex = 0
				}
				.tabItem {
					Image(systemName: "house")
				}
				.tag(0)
			
			SearchView()
				.onAppear {
					tabIndex = 1
				}
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
				.tag(1)

			
			UploadPostView(selectedTab: $tabIndex)
				.onAppear {
					tabIndex = 2
				}
				.tabItem {
					Image(systemName: "plus.square")
				}
				.tag(2)
			
			Text("Notifications")
				.onAppear {
					tabIndex = 3
				}
				.tabItem {
					Image(systemName: "heart")
				}
				.tag(3)
			
			CurrentUserProfileView(user: User.mockUsers[0])
				.onAppear {
					tabIndex = 4
				}
				.tabItem {
					Image(systemName: "person")
				}
				.tag(4)
		}
		.tint(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
