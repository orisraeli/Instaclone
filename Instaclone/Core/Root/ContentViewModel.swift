//
//  ContentViewModel.swift
//  Instaclone
//
//  Created by Or Israeli on 09/08/2023.
//

import Combine
import Firebase
import Foundation

class ContentViewModel: ObservableObject {
	private let service = AuthService.shared
	private var cancellables = Set<AnyCancellable>()
	
	@Published var userSession: FirebaseAuth.User?
	
	init() {
		setupSubscribers()
	}
	
	func setupSubscribers() {
		service.userSession.publisher.sink { [weak self] userSession in
			self?.userSession = userSession
		}
		.store(in: &cancellables)
	}
}
