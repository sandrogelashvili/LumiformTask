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
                Group {
                    if let page = viewModel.mainPageContent {
                        ScrollView {
                            ContentListView(item: page, sectionLevel: 2)
                                .padding()
                            
                            navigationButton
                        }
                        .scrollIndicators(.hidden)
                        
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                        
                    } else {
                        ProgressView("Loading...")
                    }
                }
                .task {
                    await viewModel.fetchContent()
                }
            }
            .navigationTitle(viewModel.mainPageContent?.title ?? "")
        }
    }
    
    private var navigationButton: some View {
        let attribute = PrimaryButton.Attribute(
            image: .arrowLeft,
            title: "Go to second page",
            action: {
                viewModel.navigateToSecondPage()
            }
        )
        return PrimaryButton(attribute: attribute)
    }
}
