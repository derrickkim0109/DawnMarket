//
//  AppSubDisplayClassCellView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppSubDisplayClassCellView: View {
    @ObservedObject var viewModel: CategoryDetailViewModel
    let item: AppSubDisplayClassInfoFetchItemModel
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .foregroundStyle(Color.gray100)
            
            HStack(spacing: 0) {
                Divider()
                    .foregroundStyle(Color.gray100)
                    .frame(width: 1)
                
                appSubDisplayClassTitleView()
                
                Spacer()
            }
            .onTapGesture {
                viewModel.didSelectSubCategory(item)
            }
        }
    }
}

extension AppSubDisplayClassCellView {
    private func appSubDisplayClassTitleView() -> some View {
        HStack {
            Text("\(item.subDisplayClassName)")
                .font(.pretendard(size: 14, type: .regular))
                .foregroundStyle(
                    viewModel.selectedSubCategorySequence == item.displayClassSequence ? Color.black900 : Color.gray700
                )
                .multilineTextAlignment(.leading)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .contentShape(Rectangle())
        }
        .padding(10)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
}

#Preview {
    let container = CategoryDIContainer()
    let viewModel = container.categoryDetailViewDependencies(categoryRouter: container.categoryRouter(), displayClassItem: .completedMock)
    viewModel.viewWillAppear()
    
    return AppSubDisplayClassCellView(viewModel: viewModel, item: .completedMock)
}
