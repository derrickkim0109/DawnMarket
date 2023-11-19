//
//  CategoryView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel: CategoryViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CategoryView(viewModel: AppDIContainer().categoryViewDependencies())
}
