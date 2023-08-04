//
//  ProfileView.swift
//  Instaclone
//
//  Created by Or Israeli on 04/08/2023.
//

import SwiftUI

struct ProfileView: View {
	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: 1),
		GridItem(.flexible(), spacing: 1),
		GridItem(.flexible(), spacing: 1)
	]
	
    var body: some View {
		NavigationStack {
			ScrollView {
				//header
				VStack(spacing: 10) {
					//profile picture, stats
					HStack {
						Image("blackpanther-1")
							.resizable()
							.scaledToFill()
							.frame(width: 80, height: 80)
							.clipShape(Circle())
						
						Spacer()
						
						HStack(spacing: 8) {
							UserStatView(value: 3, title: "Posts")
								.frame(width: 80)
							
							UserStatView(value: 76, title: "Followers")
								.frame(width: 80)
							
							UserStatView(value: 42, title: "Following")
								.frame(width: 80)

						}
					}
					.padding(.horizontal)
					
					//username, bio
					VStack(alignment: .leading, spacing: 4) {
						Text("Chadwick Boseman")
							.font(.footnote)
							.fontWeight(.semibold)
						
						Text("Wakanda Forever")
							.font(.footnote)
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
					
					//edit profile button
					Button {
						//TODO: add button action
						
					} label: {
						Text("Edit Profile")
							.font(.subheadline)
							.fontWeight(.semibold)
							.frame(width: 360, height: 32)
							.foregroundColor(.black)
							.overlay {
								RoundedRectangle(cornerRadius: 6)
									.stroke(.gray, lineWidth: 1)
							}
					}
					
					Divider()
				}
				
				
				//posts grid
				LazyVGrid(columns: columns, spacing: 1) {
					ForEach(0..<15, id: \.self) { index in
						Image("blackpanther-2")
							.resizable()
							.scaledToFill()
					}
				}
				.background(.red)
			}
			.navigationTitle("Profile")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					//menu button
					Button {
						//TODO: add button action
						
					} label: {
						Label("Menu", systemImage: "line.3.horizontal")
							.foregroundColor(.black)
					}
				}
			}
		}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
