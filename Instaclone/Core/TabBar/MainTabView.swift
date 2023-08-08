//
//  MainTabView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
		TabView {
			FeedView()
				.tabItem {
					Image(systemName: "house")
				}
			
			SearchView()
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
			
			Text("Upload")
				.tabItem {
					Image(systemName: "plus.square")
				}
			
			Text("Notifications")
				.tabItem {
					Image(systemName: "heart")
				}
			
			CurrentUserProfileView()
				.tabItem {
					Image(systemName: "person")
				}
		}
		.tint(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
