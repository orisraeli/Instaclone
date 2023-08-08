//
//  ICTextField.swift
//  Instaclone
//
//  Created by Or Israeli on 08/08/2023.
//

import SwiftUI

struct ICTextField: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.subheadline)
			.padding()
			.background(Color(.systemGray6))
			.cornerRadius(10)
			.padding(.horizontal, 24)
	}
}

extension View {
	func ICTextFieldStyle() -> some View {
		modifier(ICTextField())
	}
}
