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
        VStack {
            Group {
                if let page = viewModel.secondPageContent {
                    ContentListView(item: page, sectionLevel: 1)
                        .padding()
                    
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                    
                } else {
                    ProgressView("Loading...")
                }
            }
        }
        .task {
            await viewModel.fetchSecondPage()
        }
        .navigationTitle(viewModel.secondPageContent?.title ?? "")
    }
}
