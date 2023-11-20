//
//  CategoryHeaderView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Combine

struct CategoryHeaderView: View {
    @ObservedObject var viewModel: CategoryViewModel

    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            
            Text("로그인해주세요")
                .font(
                    Font.pretendard(
                        size: 17, type: .bold
                    )
                )
            
            Spacer()
            
            HStack(spacing: 16) {
                Image.iconBellImage
                    .resizable()
                    .frame(width: 24)
                    .overlay {
                        Image.iconNewBadgeImage
                            .resizable()
                            .frame(width: 16, height: 16)
                            .offset(x: 7, y: -5)
                    }
                    .onTapGesture {
                        viewModel.showToastByDebounce()
                    }

                Image.iconSettingImage
                    .resizable()
                    .frame(width: 24)
                    .onTapGesture {
                        viewModel.showToastByDebounce()
                    }
            }
            .frame(height: 24)
            
            Spacer()
                .frame(width: 20)
        }
    }
}
