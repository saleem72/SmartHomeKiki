//
//  FunctionalityButton.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

struct FunctionalityButton: ButtonStyle {
    @Binding var isActive: Bool
    @Binding var isOn: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 24, height: 24)
            .frame(width: 46, height: 46)
            .foregroundColor(isActive ? Theme.text : Color.white.opacity(0.6))
            .background(
                isOn ?
                    (isActive ?
                        Theme.activeButtonGradient :
                        Theme.inActiveButtonGradient) :
                    Theme.inActiveButtonGradient
            )
            .mask(RoundedRectangle(cornerRadius: 8))
    }
}
