//
//  LaunchScreenStateManager.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/25/23.
//

import Foundation
import Combine

final class LaunchScreenStateManager: ObservableObject {
    @Published private(set) var state: LaunchScreenStep = .start
    private var cancellable = Set<AnyCancellable>()

    func dismiss() {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.state = .finished
            }.store(in: &cancellable)
    }
}
