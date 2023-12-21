//
//  View.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import SwiftUI

extension View {
    func showErrorAlert(
        isPresented: Binding<Bool>,
        message : String?
    ) -> some View {
        self.alert(isPresented: isPresented) {
            Alert(
                title: Text("알림"),
                message: Text(message ?? ""),
                dismissButton: .default(Text("확인"))
            )
        }
    }

    @ViewBuilder
    func hiddenConditionally(isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }

    func tabBarItem(
        tab: TabBarItemType,
        selection: Binding<TabBarItemType>
    ) -> some View {
        modifier(
            TabBarItemViewModifier(
                tab: tab,
                selection: selection
            )
        )
    }

    func toast<Content: View>(
        isPresented: Binding<Bool>,
        duration: Double,
        content: @escaping () -> Content
    ) -> some View {
        ToastView(
            isPresented: isPresented,
            duration: duration,
            content: content
        )
    }
}
