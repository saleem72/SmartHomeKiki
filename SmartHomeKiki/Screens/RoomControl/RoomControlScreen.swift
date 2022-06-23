//
//  RoomControlScreen.swift
//  ResponsiveUI
//
//  Created by Yousef on 6/20/22.
//

import SwiftUI

struct RoomControlScreen: View {
    
    @State private var isOn: Bool = true
    @State private var isCoolOn: Bool = false
    @State private var isHeatOn: Bool = false
    @State private var isFanOn: Bool = false
    @State private var isRepeatOn: Bool = false
    @State private var tempreture: Double = 18
    var body: some View {
        ZStack {
            Theme.background
                .edgesIgnoringSafeArea(.all)
            content
        }
        .navigationBarHidden(true)
    }
}

extension RoomControlScreen {
    private var content: some View {
        VStack(spacing: 0) {
            header
            deviceSection
                .padding(.horizontal, 20)
            roomControl
        }
        .foregroundColor(Theme.text)
    }
    private var header: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: Asset.System.back)
                    .font(.callout)
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
            })
            
            Spacer(minLength: 0)
            
            Button(action: {}, label: {
                Image(systemName: Asset.System.more)
                    .font(.callout)
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
            })
        }
        .padding(.horizontal)
        .frame(height: 50)
    }
    
    private var deviceSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Turbo Ac")
                    .font(.headline)
                Text("Bedroom")
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .foregroundColor(Theme.fadeText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: {
                isOn.toggle()
            }, label: {
                Image(Asset.onOff)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(isOn ? Theme.text : Theme.fadeText)
                    .frame(width: 18.67, height: 18.67)
                    .frame(width: 44, height: 44)
                    .background(
                        isOn ?
                            Theme.activeButtonGradient :
                            Theme.inActiveButtonGradient
                    )
                    .mask(Circle())
            })
        }
        .padding(.top, 12)
    }
    
    private var coolerButton: some View {
        Button(action: {
            isCoolOn.toggle()
        }, label: {
            Image(Asset.snow)
                .resize()
        })
        .buttonStyle(FunctionalityButton(isActive: $isCoolOn, isOn: $isOn))
        .frame(maxWidth: .infinity)
        .disabled(!isOn)
    }
    
    private var heaterButton: some View {
        Button(action: {
            isHeatOn.toggle()
        }, label: {
            Image(Asset.heat)
                .resize()
        })
        .buttonStyle(FunctionalityButton(isActive: $isHeatOn, isOn: $isOn))
        .frame(maxWidth: .infinity)
        .disabled(!isOn)
    }
    
    private var fanButton: some View {
        Button(action: {
            isFanOn.toggle()
        }, label: {
            Image(Asset.fan)
                .resize()
        })
        .buttonStyle(FunctionalityButton(isActive: $isFanOn, isOn: $isOn))
        .frame(maxWidth: .infinity)
        .disabled(!isOn)
    }
    
    private var repeatButton: some View {
        Button(action: {
            isRepeatOn.toggle()
        }, label: {
            Image(Asset.restart)
                .resize()
        })
        .buttonStyle(FunctionalityButton(isActive: $isRepeatOn, isOn: $isOn))
        .frame(maxWidth: .infinity)
        .disabled(!isOn)
    }
    
    private var buttonsSection: some View {
        HStack {
            coolerButton
            heaterButton
            fanButton
            repeatButton
        }
        .frame(height: 100)
        .background(
            ZStack {
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black.opacity(0.03))
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Theme.strokeGradient, lineWidth: 1)
            }
            .background(
                ZStack {
                    if isOn {
                        Circle()
                            .fill(Color(hex: "2E59E6").opacity(0.35))
                            .frame(width: 154, height: 154)
                            .blur(radius: 60)
                            .offset(y: 70)
                    }
                }
            )
        )
    }
    
    private var infoSection: some View {
        HStack {
            InfoLabel(title: "Temp Indoor", value: "18", unit: "°C")
                .frame(maxWidth: .infinity)
            InfoLabel(title: "Temp Out", value: "30", unit: "°C")
                .frame(maxWidth: .infinity)
            InfoLabel(title: "Wind Speed", value: "2", unit: "Grade")
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var roomControl: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                buttonsSection
                    .padding(.top, 16)
                
                TempretureRadial(isOn: isOn, tempreture: $tempreture)
                    .padding(.top, 28)
                
                infoSection
                    .padding(.top, 40)
                
                HStack(spacing: 19) {
                    SmartToggle(title: "Fan", isActive: $isFanOn, isEnabled: isOn)
                    SmartToggle(title: "Cooler", isActive: $isCoolOn, isEnabled: isOn)
                }
                .padding(.top, 12)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct RoomControlScreen_Previews: PreviewProvider {
    static var previews: some View {
        RoomControlScreen()
    }
}






