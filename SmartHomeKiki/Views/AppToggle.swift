//
//  AppToggle.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

struct AppToggle: View {
    @Binding var isActive: Bool
    var isEnabled: Bool
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color(hex: "232532"))
                .frame(width: 48, height: 24)
            Circle()
                .fill(
                    isActive ?
                        Theme.activeButtonGradient :
                        Theme.inActiveButtonGradient
                )
                .frame(width: 16, height: 16)
                .offset(x: isActive ? 10 : -10)
        }
        .onTapGesture {
            if isEnabled {
                withAnimation(.spring()) {
                    isActive.toggle()
                }
            }
        }
    }
}
