//
//  InfoLabel.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

struct InfoLabel: View {
    var title: String
    var value: String
    var unit: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 12))
                .fontWeight(.medium)
            
            HStack {
                Text(value)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                Text(unit)
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(Color.white.opacity(0.5))
            }
        }
        .padding(.horizontal, 12)
        .frame(height: 76)
        .frame(minWidth: 98)
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


