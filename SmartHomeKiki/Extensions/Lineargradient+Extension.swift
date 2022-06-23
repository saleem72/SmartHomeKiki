//
//  Lineargradient+Extension.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

extension LinearGradient {
    init(colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}
