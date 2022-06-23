//
//  WeatherItem.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import SwiftUI

struct WeatherItem: View {
    var value: String
    var unit: String?
    var title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.largeTitle)
                .frame(width: 64, height: 64)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: .white, .white))
                        .opacity(0.12)
                )
                .overlay(
                    ZStack {
                        if let unit = unit {
                            Text(unit)
                                .customFont(weight: .regular, size: 11)
                                .foregroundColor(Color.white.opacity(0.5))
                                .padding(6)
                        }
                    },
                    alignment: .topTrailing
                )
            
            Text(title)
                .customFont(weight: .light, size: 12)
        }
        .padding(.horizontal)
    }
}
