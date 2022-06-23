//
//  TempretureRadial.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

struct TempretureRadial: View {
    var isOn: Bool
    @Binding var tempreture: Double
    
    var trim: CGFloat {
        CGFloat(tempreture) / 40.0
    }
    
    var fillColor: Color {
        isOn ? Color(hex: "15C55D") : Color(hex: "D93939")
    }
    
    var firstShadowColor: Color {
        isOn ? Color(hex: "45FF8F").opacity(0.9) : Color(hex: "FF4545").opacity(0.9)
    }
    
    var secondShadowColor: Color {
        isOn ? Color(hex: "00FF66").opacity(0.9) : Color(hex: "FF0000").opacity(0.9)
    }
    
    private let dialOutterRadius: CGFloat = 200
//    @State var rotationDegree: Double = 0
    
    var body: some View {
        ZStack {
            outterCircle
            meterCircle
            innerCircle
            onOffIndicator
            currentIndicator
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    guard isOn else { return }
                    let x = min(max(value.location.x, 0), dialOutterRadius)
                    let y = min(max(value.location.y, 0), dialOutterRadius)
                    
                    let endPoint = CGPoint(x: x, y: y)
                    let centerPoint = CGPoint(x: dialOutterRadius / 2, y: dialOutterRadius / 2)
                    
                    let angle = calculateAngle(centerPoint: centerPoint, endPoint: endPoint)
                    guard angle < 270 else { return }
                    tempreture = calculateValue(angle: angle)
//                    rotationDegree = Double(angle)
                }
        )
    }
    
    
    func calculateAngle(centerPoint: CGPoint, endPoint: CGPoint) -> CGFloat {
        let radian = atan2(endPoint.x - centerPoint.x, centerPoint.y - endPoint.y)
        
        let degree = 180 + (radian * 180 / .pi)
        
        return degree
    }
    
    func calculateValue(angle: CGFloat) -> Double {
        Double(angle) * 40 / 360
    }
}

extension TempretureRadial {
    private var currentIndicator: some View {
        Circle()
            .fill(Color.white.opacity(0.12))
            .blur(radius: 1)
            .frame(width: 26, height: 26)
            .overlay(
                Circle()
                    .fill(Color.white)
                    .frame(width: 6, height: 6)
            )
            .offset(x: 0, y: 92)
            .compositingGroup()
            .rotationEffect(.degrees(Double(trim * 360)))
    }
    
    private var onOffIndicator: some View {
        Circle()
            .fill(fillColor)
            .frame(width: 8, height: 8)
            .shadow(color: firstShadowColor, radius: 19.44, x: 0.0, y: 0.0)
            .shadow(color: secondShadowColor, radius: 6.48, x: 0.0, y: 0.0)
            .offset(y: 60)
    }
    
    private var outterCircle: some View {
        Circle()
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "131A33"),
                        Color(hex: "131A33").opacity(0.8)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ),
                lineWidth: 1.3
            )
            .frame(width: 217.68, height: 217.68)
            .overlay(
                ZStack {
                    
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "131A33"),
                                    Color(hex: "131A33").opacity(0.8)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                    if isOn {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hex: "131A33"),
                                        Color(hex: "131A33").opacity(0.8)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .shadow(color: Color(hex: "3261FF").opacity(0.51), radius: 108.84, x: 41.46, y: -16)
                            .shadow(color: Color(hex: "5A33FF").opacity(0.42), radius: 101.07, x: -55.72, y: -10)
                    }
                    
                    Circle()
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "BF8CFF").opacity(0.33),
                                    Color.black.opacity(0)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1.3
                    )
                }
            )
    }
    
    private var meterCircle: some View {
        Circle()
            .trim(from: 0, to: trim)
            .rotation(.degrees(90))
            .stroke(
                Theme.radialStroke,
                style: StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round)
            )
            .frame(width: 184, height: 184)
    }
    
    private var innerCircle: some View {
        ZStack {
            Text("\(Int(tempreture))")
                .font(.system(size: 46))
                .fontWeight(.semibold)
                .overlay(
                    Text("°C")
                        .font(.system(size: 16.84))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white.opacity(0.5))
                        .offset(x: 20, y: -5),
                    
                    alignment: .topTrailing
                )
            
            
        }
        .frame(width: 152.89, height: 152.89)
        .background(
            Circle()
                .fill(Color(hex: "151D3C"))
                .shadow(color: Color.black.opacity(0.85), radius: 15.55, x: 0.0, y: 5.18)
        )
    }
}

