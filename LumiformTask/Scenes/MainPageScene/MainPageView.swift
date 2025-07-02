//
//  ContentView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct MainPageView: View {
    @StateObject var viewModel: MainPageViewModel
    
    var body: some View {
        ZStack {
            Color(.defaultWhite)
                .ignoresSafeArea()
            
            VStack {
                if viewModel.isLoading {
                    ProgressView(UIStrings.Label.loading)
                    
                } else if let page = viewModel.mainPageContent {
                    ScrollView {
                        ContentListView(item: page, sectionLevel: 2)
                            .padding()
                        
                        navigationButton
                    }
                    .scrollIndicators(.hidden)
                    
                } else if viewModel.initialLoadCompleted {
                    failedLoadingView
                }
            }
            .navigationTitle(viewModel.mainPageContent?.title ?? .empty)
            .errorAlert(isPresented: $viewModel.isShowingError, message: viewModel.errorMessage)
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
        let attribute = FailedLoadingView.Attribute(
            action: {
                viewModel.fetchContent()
            })
        return FailedLoadingView(attribute: attribute)
    }
}
