//
//  TabbarView.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import SwiftUI

struct TabbarView: View {
    
    @Binding var selectedTab: TabbarItem
    
    var body: some View {
        HStack {
            ForEach(TabbarItem.allCases) { item in
                ItemBarButton(item: item, selectedTab: $selectedTab)
            }
        }
        .padding(.horizontal)
        .frame(height: 60 + safeAreaInset.bottom)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                CustomCorners(corners: [.topLeft, .topRight], radius: 40)
                    .fill(Theme.background)
                
                CustomCorners(corners: [.topLeft, .topRight], radius: 40)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "BF8CFF").opacity(0.33),
                                Color.black
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
            .edgesIgnoringSafeArea(.bottom)
        )
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Theme.background.edgesIgnoringSafeArea(.all)
            TabbarView(selectedTab: .constant(.home))
        }
    }
}



struct ItemBarButton: View {
    var item: TabbarItem
    @Binding var selectedTab: TabbarItem
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                selectedTab = item
            }
        }, label: {
            Group {
                if item == selectedTab {
                    selectedLabel
                        .transition(.move(edge: .bottom))
                } else {
                    unSelectedLabel
                }
            }
        })
        .frame(maxWidth: .infinity)
    }
}

extension ItemBarButton {
    private var selectedLabel: some View {
        VStack(spacing: 11) {
            Circle()
                .fill(Theme.activeButtonGradient)
                .frame(width: 6, height: 6)
                .background(
                    Circle()
                        .fill(Color(hex: "3161FE").opacity(0.5))
                        .frame(width: 16, height: 16)
                        .blur(radius: 4)
                )
            
            Text(item.rawValue.capitalized)
                .customFont(weight: .semiBold, size: 14)
                .foregroundColor(Color.white.opacity(0.95))
        }
        .padding(.top)
    }
    
    private var unSelectedLabel: some View {
        Image(item.icon)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .foregroundColor(Color(hex: "88898B"))
            .frame(width: 44, height: 44)
    }
}
