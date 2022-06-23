//
//  Image+Extension.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

extension Image {
    func resize(mode: ContentMode = .fit) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: mode)
            
    }
    
    func renderingResize(mode: ContentMode = .fit) -> some View {
        self
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: mode)
            
    }
}

