//
//  Topography.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

/*
 Inter
 Inter-Regular
 Inter-Thin
 Inter-Light
 Inter-Medium
 Inter-SemiBold
 Inter-Bold
 */

enum Topography {
    static func dynamic(_ type: FontType) -> Font {
        return Font.custom(type.fontName, size: type.size, relativeTo: type.textStyle)
    }
    
    static func dynamic(weight: FontWeight, size: CGFloat) -> Font {
        return Font.custom(weight.fontName, size: size)
    }
    
    static func regular(_ size: CGFloat = 16) -> Font {
        Font.custom("Inter-Regular", size: size)
    }
    
    static func semiBold(_ size: CGFloat = 16) -> Font {
        Font.custom("Inter-SemiBold", size: size)
    }
    
    static func bold(_ size: CGFloat = 16) -> Font {
        Font.custom("Inter-Bold", size: size)
    }
    
    static func light(_ size: CGFloat = 16) -> Font {
        Font.custom("Inter-Light", size: size)
    }

    static func medium(_ size: CGFloat = 16) -> Font {
        Font.custom("Inter-Medium", size: size)
    }
}

struct CustomDynamicFontModifire: ViewModifier {
    
    var type: Topography.FontType
    
    func body(content: Content) -> some View {
        content
            .font(Topography.dynamic(type))
    }
}

struct CustomFontWeightModifire: ViewModifier {
    
    var weight: Topography.FontWeight
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Topography.dynamic(weight: weight, size: size))
    }
}

extension View {
    func customFont(_ type: Topography.FontType = .body) -> some View {
        modifier(CustomDynamicFontModifire(type: type))
    }
    
    func customFont(weight: Topography.FontWeight, size: CGFloat = 16) -> some View {
        modifier(CustomFontWeightModifire(weight: weight, size: size))
    }
}

extension Topography {
    enum FontWeight {
        case regular
        case semiBold
        case bold
        case light
        case medium
        case thin
        
        var fontName: String {
            switch self {
            case .regular: return "Inter-Regular"
            case .semiBold: return "Inter-SemiBold"
            case .bold: return "Inter-Bold"
            case .light: return "Inter-Light"
            case .medium: return "Inter-Medium"
            case .thin: return "Inter-Thin"
            }
        }
        
    }
    enum FontType: String, Identifiable, CaseIterable {
        case largeTitle
        case title
        case title2
        case title3
        case body
        case headline
        case callout
        case subheadline
        case footnote
        case caption
        case caption2
        
        var id: String { rawValue }
        
        var textStyle: Font.TextStyle {
            switch self {
            case .largeTitle: return .largeTitle
            case .title: return .title
            case .title2: return .title2
            case .title3: return .title3
            case .headline: return .headline
            case .subheadline: return .subheadline
            case .body: return .body
            case .footnote: return .footnote
            case .caption: return .caption
            case .caption2: return .caption2
            case .callout: return .callout
            }
        }
        
        var size: CGFloat {
            switch self {
            case .largeTitle: return 34
            case .title: return 28
            case .title2: return 22
            case .title3: return 20
            case .headline: return 17 // semiBold
            case .subheadline: return 15
            case .body: return 17
            case .footnote: return 13
            case .caption: return 12
            case .caption2: return 11
            case .callout: return 16
            }
        }
        
        var fontName: String {
            switch self {
            case .largeTitle, .title, .title2, .title3: return "Inter-Bold"
            case .body, .subheadline, .footnote, .caption, .callout: return "Inter-Regular"
            case .headline, .caption2: return "Inter-SemiBold"
            }
        }
    }
}
