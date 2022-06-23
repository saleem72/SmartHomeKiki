//
//  MainTabbarScreen.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import SwiftUI

struct MainTabbarScreen: View {
    @State private var selectedTab: TabbarItem = .home
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background.edgesIgnoringSafeArea(.all)
                
                Group {
                    switch selectedTab {
                    case .home: HomeScreen()
                    case .contacts: Text("Contacts")
                    case .control: RoomControlScreen()
                    case .settings: Text("Settings")
                    }
                }
                .foregroundColor(Theme.text)
            }
            .navigationBarHidden(true)
            .overlay(TabbarView(selectedTab: $selectedTab), alignment: .bottom)
        }
    }
}

struct MainTabbarScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbarScreen()
    }
}
