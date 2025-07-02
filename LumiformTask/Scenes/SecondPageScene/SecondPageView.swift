//
//  SecondPageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import SwiftUI

struct SecondPageView: View {
    @StateObject var viewModel: SecondPageViewModel
    
    var body: some View {
        ZStack {
            Color(.defaultWhite)
                .ignoresSafeArea()
            
            VStack {
                if viewModel.isLoading {
                    ProgressView(UIStrings.Label.loading)
                    
                } else if let page = viewModel.secondPageContent {
                    VStack {
                        ContentListView(item: page, sectionLevel: 1)
                            .padding()
                        
                        Spacer()
                    }
                    
                } else {
                    failedLoadingView
                }
            }
            .navigationTitle(viewModel.secondPageContent?.title ?? .empty)
            .errorAlert(isPresented: $viewModel.isShowingError, message: viewModel.errorMessage)
            .task {
                viewModel.fetchSecondPage()
            }
        }
        
    }
    
    private var failedLoadingView: some View {
        let attribute = FailedLoadingView.Attribute(
            action: {
                viewModel.fetchSecondPage()
            })
        return FailedLoadingView(attribute: attribute)
    }
}
