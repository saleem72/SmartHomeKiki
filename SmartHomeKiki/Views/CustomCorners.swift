//
//  CustomCorners.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import SwiftUI

struct CustomCorners: Shape {
    let corners: UIRectCorner
    let radius: Double
    func path(in rect: CGRect) -> Path {
        let view = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(view.cgPath)
    }
}
