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
					ForEach(0..<15, id: \.self) { user in
						HStack {
							Image("batman-2")
								.resizable()
								.scaledToFill()
								.frame(width: 40)
								.clipShape(Circle())
							
							VStack(alignment: .leading) {
								Text("batman77")
									.fontWeight(.semibold)
								
								Text("Bruce Wayne")
							}
							.font(.footnote)
							
							Spacer()
						}
						.padding(.horizontal)
					}
				}
				.padding(.top, 8)
				.searchable(text: $searchTerm, prompt: "Search...")
			}
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
