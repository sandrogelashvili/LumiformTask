//
//  ErrorAlertModifier.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String?
    
    func body(content: Content) -> some View {
        content.alert("Error", isPresented: $isPresented) {
            Button("OK", role: .cancel) {
                isPresented = false
            }
        } message: {
            Text(message ?? "Unknown error")
        }
    }
}

extension View {
    func errorAlert(isPresented: Binding<Bool>, message: String?) -> some View {
        self.modifier(ErrorAlertModifier(isPresented: isPresented, message: message))
    }
}
