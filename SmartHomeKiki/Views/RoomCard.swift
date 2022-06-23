//
//  RoomCard.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import SwiftUI

struct RoomCard: View {
    let room: Room
    
    var fillColor: Color {
        room.isActive ? Color(hex: "15C55D") : Color(hex: "D93939")
    }
    
    var firstShadowColor: Color {
        room.isActive ? Color(hex: "45FF8F").opacity(0.9) : Color(hex: "FF4545").opacity(0.9)
    }
    
    var secondShadowColor: Color {
        room.isActive ? Color(hex: "00FF66").opacity(0.9) : Color(hex: "FF0000").opacity(0.9)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Image(room.image)
                .resize(mode: .fill)
                .frame(width: 196, height: 224)
                .clipped()
                .mask(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(room.title)
                    .customFont(.title3)
                
                if !room.devices.isEmpty {
                    HStack(spacing: 12) {
                        Text("\(room.devices.count) DEVICES")
                            .customFont(weight: .light, size: 14)
                            .foregroundColor(Color.white.opacity(0.5))
                        
                        isActive
                    }
                }
            }
            .frame(width: 196, alignment: .leading)
                
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
                .blur(radius: 2)
                .shadow(color: Color(hex: "1C32FF").opacity(0.09), radius: 79, x: 0.0, y: 4)
        )
        .contentShape(Rectangle())
    }
    
    private var isActive: some View {
        Circle()
            .fill(fillColor)
            .frame(width: 8, height: 8)
            .shadow(color: firstShadowColor, radius: 19.44, x: 0.0, y: 0.0)
            .shadow(color: secondShadowColor, radius: 6.48, x: 0.0, y: 0.0)
    }
}
