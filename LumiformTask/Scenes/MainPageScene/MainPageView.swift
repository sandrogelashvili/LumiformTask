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
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                CustomTextView(text: "Hello, world!", style: .sectionTitle(level: 2), color: .defaultBlack)
            }
            .padding()
        }
    }
}
