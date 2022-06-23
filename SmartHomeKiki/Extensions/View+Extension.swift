//
//  View+Extension.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import SwiftUI

extension View {
    var safeAreaInset: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
}
