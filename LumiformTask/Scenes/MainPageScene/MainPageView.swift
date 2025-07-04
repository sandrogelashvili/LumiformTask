//
//  ContentView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct MainPageView: View {
    @State var viewModel: MainPageViewModeling

    var body: some View {
        ZStack {
            Color(.defaultWhite)
                .ignoresSafeArea()

            VStack {
                if viewModel.state.isLoading {
                    ProgressView(UIStrings.Label.loading)
                } else if let page = viewModel.state.mainPageContent {
                    ScrollView {
                        ContentListView(item: page, sectionLevel: 2)
                            .padding()
                        navigationButton
                    }
                    .scrollIndicators(.hidden)
                } else if viewModel.state.initialLoadCompleted {
                    failedLoadingView
                }
            }
            .navigationTitle(viewModel.state.mainPageContent?.title ?? .empty)
            .errorAlert(
                isPresented: $viewModel.state.isShowingError,
                message: viewModel.state.errorMessage
            )
            .task {
                viewModel.fetchContent()
            }
        }
    }

    private var navigationButton: some View {
        let attribute = PrimaryButton.Attribute(
            image: .system(UIStrings.SystemImage.chevronRight),
            title: UIStrings.Button.secondPage,
            action: {
                viewModel.navigateToSecondPage()
            }
        )
        return PrimaryButton(attribute: attribute)
    }

    private var failedLoadingView: some View {
        let attribute = FailedLoadingView.Attribute {
            viewModel.fetchContent()
        }
        return FailedLoadingView(attribute: attribute)
    }
}
