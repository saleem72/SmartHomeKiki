//
//  ContentView.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabbarScreen()
    }
    
    func getFonts() {
        let families = UIFont.familyNames
        for family in families {
            let fonts = UIFont.fontNames(forFamilyName: family)
            print(family)
            for font in fonts {
                print(font)
            }
            print("______________________________________")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
