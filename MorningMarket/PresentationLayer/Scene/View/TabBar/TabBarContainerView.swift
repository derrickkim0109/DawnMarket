//
//  TabBarContainerView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct TabBarContainerView<Content: View>: View {
    @State private var showToast: Bool = false
    @State private var allTabItemType: [TabBarItemType] = TabBarItemType.allCases
    @Binding private var selection: TabBarItemType
    private let content: Content

    init(
        selection: Binding<TabBarItemType>,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay {
                    VStack {
                        Spacer()
                            .toast(isPresented: $showToast, duration: 1) {
                                Text("개발 예정")
                            }
                    }
                }

            VStack(spacing: 0) {
                Divider()
                    .background(.gray)

                CustomTabBarView(
                    localSelection: selection,
                    selection: $selection,
                    showToast: $showToast,
                    allTabItemType: allTabItemType
                )
            }
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) { value in
            allTabItemType = value
        }
    }
}
