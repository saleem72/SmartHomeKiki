//
//  Theme.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/20/22.
//

import SwiftUI

enum Theme {
    static let background: Color = Color("shBackground") // 16171B
    static let lightBlue = Color("shLightBlue") // 3161FE
    static let darkBlue = Color("shDarkBlue") // 5A31FE
    static let darkPurple = Color("shDarkPurple") // 3B3163
    static let lightPurple = Color("shLightPurple") // 354269
    
    static let strokeFrom = Color.white.opacity(0.08)
    static let strokeTo = Color("shStrokeTo").opacity(0.24) // 9C8CFF
    
    static let text = Color.white
    static let fadeText = Color.white.opacity(0.8)
    
    static let activeButtonGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color("shLightBlue"),
            Color("shDarkBlue")
        ]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    static let inActiveButtonGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color("shLightPurple"),
            Color("shDarkPurple")
        ]),
        startPoint: UnitPoint(x: 0.25, y: 0.5),
        endPoint: UnitPoint(x: 0.75, y: 0.5)
    )
    
    static let strokeGradient = LinearGradient(
        gradient: Gradient(colors: [
            strokeFrom,
            strokeTo
        ]),
        startPoint: .top, // UnitPoint(x: 0.25, y: 0.5),
        endPoint: .bottom // UnitPoint(x: 0.75, y: 0.5)
    )
    
    static let radialStroke = AngularGradient(
        gradient: Gradient(colors: [
            Color(hex: "3161FE"),
            Color(hex: "8133FF")
        ]),
        center: .center,
        startAngle: .degrees(-185),
        endAngle: .degrees(0)
    )
}
