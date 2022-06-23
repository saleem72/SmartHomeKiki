//
//  SmartToggle.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

struct SmartToggle: View {
    var title: String
    @Binding var isActive: Bool
    var isEnabled: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                
                Text(isActive ? "On" : "Off")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            Spacer(minLength: 0)
            
            AppToggle(isActive: $isActive, isEnabled: isEnabled)
        }
        .padding(.horizontal)
        .frame(height: 76)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black.opacity(0.5))
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Theme.strokeGradient, lineWidth: 1)
            }
        )
    }
}

