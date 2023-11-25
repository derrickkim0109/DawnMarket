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
    @State private var cancellable = Set<AnyCancellable>()

    var body: some View {
        if isPresented {
            ZStack {
                VStack {
                    Spacer()

                    HStack {
                        Spacer()

                        ToastContentView()

                        Spacer()
                    }

                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                Timer.publish(every: 1, on: .main, in: .common)
                    .autoconnect()
                    .receive(on: DispatchQueue.main)
                    .sink { _ in
                        withAnimation {
                            isPresented = false
                        }
                    }.store(in: &cancellable)
            }
        }
    }

    private func ToastContentView() -> some View {
        content()
            .padding()
            .background(Color.blue900)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .transition(.slide)
            .animation(.easeInOut, value: 100)
    }
}
