//
//  ToastView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Combine

struct ToastView<Content: View>: View {
    @Binding var isPresented: Bool
    var duration: Double
    var content: () -> Content
    @State private var cancellable: AnyCancellable?

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
                cancellable?.cancel()

                cancellable = Timer.publish(every: duration, on: .main, in: .common)
                    .autoconnect()
                    .sink { _ in
                        withAnimation {
                            isPresented = false
                        }
                    }
            }
            .onDisappear {
                cancellable?.cancel()
            }
        }
    }

    private func toastContentView() -> some View {
        content()
            .padding()
            .background(Color.blue900)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .transition(.opacity)
            .animation(.smooth, value: 100)
    }
}
