//
//  LaunchScreenView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/25/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var startAnimation = false
    @ObservedObject private var launchScreenState: LaunchScreenStateManager

    init(launchScreenState: LaunchScreenStateManager) {
        self.launchScreenState = launchScreenState
    }

    var body: some View {
        ZStack {
            Color.blue800.ignoresSafeArea()
            LogoMeteorImage()
                .offset(
                    x: startAnimation ? -150 : -110,
                    y: startAnimation ? -200 : -300
                )

            LogoMeteorImage()
                .offset(
                    x: startAnimation ? 40 : 110,
                    y: startAnimation ? -250 : -350
                )

            LogoImageView()
        }
        .onReceive(animationTimer) { timerValue in
            updateAnimation()
        }
        .opacity(startAnimation ? 0 : 1)
    }

    private func LogoImageView() -> some View {
        Image.launchScreenLogo
            .resizable()
            .scaledToFit()
            .frame(width: 192, height: 120)
            .colorMultiply(.white)
            .scaleEffect(startAnimation ? 0 : 1)
    }

    private func LogoMeteorImage() -> some View {
        Image.launchScreenMeteor
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 50)
    }

    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()

    private func updateAnimation() {
        switch launchScreenState.state {
        case .start:
            withAnimation(.easeInOut(duration: 0.9)) {
                startAnimation = true
            }
        case .finished:
            launchScreenState.dismiss()
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView(launchScreenState: LaunchScreenStateManager())
    }
}
