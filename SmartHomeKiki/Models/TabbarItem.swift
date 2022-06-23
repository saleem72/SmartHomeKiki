//
//  TabbarItem.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import Foundation

enum TabbarItem: String, Identifiable, CaseIterable {
    case home
    case control
    case contacts
    case settings

    var id: String {rawValue}

    var icon: String {
        switch self {
        case .home: return Asset.home
        case .contacts: return Asset.contacts
        case .control: return Asset.controlling
        case .settings: return Asset.settings
        }
    }
}
