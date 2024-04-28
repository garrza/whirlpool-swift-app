//
//  ModelData.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI
import Combine
import Foundation

func load<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}

class ModelData: ObservableObject {
    @Published var isLoading = true
    @Published var profiles: [Profile] = []
    @Published var activeProfile: Profile?
    @Published private(set) var didUpdateProfiles = false

    private var cancellables = Set<AnyCancellable>()
    private var timer: AnyCancellable? = nil

    init() {
        loadProfiles()
        startTimer()
    }

    private func loadProfiles() {
        guard let url = URL(string: "http://35.188.105.32:5001/users") else {
            return
        }

        load(url)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.isLoading = false
                        print("Error loading profiles: \(error)")
                        self?.didUpdateProfiles = false
                    }
                },
                receiveValue: { [weak self] (profiles: [Profile]) in
                    self?.isLoading = false
                    print("Received profiles: \(profiles)")
                    self?.profiles = profiles
                    
                    if let activeProfileId = self?.activeProfile?.uid {
                                        self?.activeProfile = profiles.first { $0.uid == activeProfileId }
                    } else {
                        self?.activeProfile = profiles.first
                    }
                    
                    self?.didUpdateProfiles = true
                }
            )
            .store(in: &cancellables)
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.loadProfiles()
            }
    }
}
