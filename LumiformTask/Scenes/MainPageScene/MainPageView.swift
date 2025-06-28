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
            
            NavigationView {
                Group {
                    if let root = viewModel.rootContent {
                        ScrollView {
                            ContentListView(item: root, sectionLevel: 1)
                                .padding()
                        }
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        ProgressView("Loading...")
                    }
                }
                .navigationTitle(viewModel.rootContent?.title ?? "Loading...")
            }
            .task {
                await viewModel.fetchContent()
            }
        }
    }
}
