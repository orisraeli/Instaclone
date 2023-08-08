//
//  SearchView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct SearchView: View {
	@State private var searchTerm = ""
	
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack(spacing: 12) {
					ForEach(User.mockUsers) { user in
						NavigationLink(value: user) {
							HStack {
								Image(user.profileImageURL ?? "")
									.resizable()
									.scaledToFill()
									.frame(width: 40)
									.clipShape(Circle())
								
								VStack(alignment: .leading) {
									Text(user.username)
										.fontWeight(.semibold)
									
									if let fullname = user.fullName {
										Text(fullname)
									}
								}
								.font(.footnote)
								
								Spacer()
							}
							.tint(.black)
							.padding(.horizontal)
							.frame(maxHeight: 40)
						}
					}
				}
				.padding(.top, 8)
				.searchable(text: $searchTerm, prompt: "Search...")
			}
			.navigationDestination(for: User.self, destination: { user in
				ProfileView(user: user)
			})
			.navigationTitle("Explore")
			.navigationBarTitleDisplayMode(.inline)
		}
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
