//
//  SecondPageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import SwiftUI

struct SecondPageView: View {
    @State var viewModel: SecondPageViewModeling
    
    var body: some View {
        ZStack {
            Color(.defaultWhite)
                .ignoresSafeArea()
            
            VStack {
                if viewModel.state.isLoading {
                    ProgressView(UIStrings.Label.loading)
                    
                } else if let page = viewModel.state.secondPageContent {
                    VStack {
                        ContentListView(item: page, sectionLevel: 1)
                            .padding()
                        
                        Spacer()
                    }
                    
                } else {
                    failedLoadingView
                }
            }
            .navigationTitle(viewModel.state.secondPageContent?.title ?? .empty)
            .errorAlert(
                isPresented: $viewModel.state.isShowingError,
                message: viewModel.state.errorMessage
            )
            .task {
                viewModel.fetchContent()
            }
        }
        
    }
    
    private var failedLoadingView: some View {
        let attribute = FailedLoadingView.Attribute(
            action: {
                viewModel.fetchContent()
            })
        return FailedLoadingView(attribute: attribute)
    }
}
