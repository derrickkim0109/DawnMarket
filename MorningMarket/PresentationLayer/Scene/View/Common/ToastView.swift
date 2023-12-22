//
//  ToastView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Combine

struct ToastView<Content: View>: View {
    @State private var cancellable: AnyCancellable?
    @Binding private var isPresented: Bool
    private var duration: Double
    private var content: Content

    init(
        isPresented: Binding<Bool>,
        duration: Double,
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = isPresented
        self.duration = duration
        self.content = content()
    }

    var body: some View {
        if isPresented {
            ZStack {
                VStack {
                    Spacer()

                    HStack {
                        Spacer()

                        toastContentView()

                        Spacer()
                    }

                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                startTimer()
            }
            .onDisappear {
                cancellable?.cancel()
            }
        }
    }
}

extension ToastView {
    private func toastContentView() -> some View {
        content
            .padding()
            .background(Color.blue900)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .transition(.opacity)
            .animation(.linear, value: 100)
    }

    private func startTimer() {
        cancellable = Timer.publish(every: duration, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                withAnimation {
                    isPresented = false
                }
            }
    }
}
