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
    @State private var cancellable: [AnyCancellable] = []

    var body: some View {
        if isPresented {
            ZStack {
                VStack {
                    Spacer()

                    HStack {

                        Spacer()

                        toastView()

                        Spacer()
                    }
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                Timer.publish(every: duration, on: .main, in: .common)
                    .autoconnect()
                    .sink { _ in
                        withAnimation {
                            isPresented = false
                        }
                    }.store(in: &cancellable)
            }
        }
    }

    @ViewBuilder
    private func toastView() -> some View {
        content()
            .padding()
            .background(Color.brandDarkNavyColor)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .transition(.slide)
            .animation(.easeInOut, value: 100)
    }
}
