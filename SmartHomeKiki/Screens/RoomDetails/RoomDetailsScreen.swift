//
//  RoomDetailsScreen.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/23/22.
//

import SwiftUI

struct RoomDetailsScreen: View {
    let room: Room
    @Environment(\.presentationMode) var presentationMode
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    
    var body: some View {
        ZStack {
            Theme.background.edgesIgnoringSafeArea(.all)
            VStack {
                header
                roomImage
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(Asset.devices)
                            .renderingResize()
                            .frame(width: 24, height: 24)
                        
                        Text("Devices")
                            .customFont(weight: .bold, size: 14)
                            .foregroundColor(Color.white.opacity(0.85))
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(room.devices, id:\.self) { device in
                                DeviceCard(device: device)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer(minLength: 0)
            }
        }
        .navigationBarHidden(true)
        .foregroundColor(Theme.text)
    }
}

extension RoomDetailsScreen {
    private var roomImage: some View {
        Image(room.image)
            .resize(mode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: 188)
            .clipped()
            .cornerRadius(12)
            .padding()
    }
    
    private var header: some View {
        HStack {
            Button(action: {
                print("Back Tapped")
                presentationMode.wrappedValue.dismiss()
            }, label: {
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
        .zIndex(1.0)
        .padding(.horizontal)
        .frame(height: 50)
        .overlay(
            Text(room.title)
                .customFont(weight: .regular, size: 20)
                .foregroundColor(Color.white.opacity(0.9))
        )
    }
}

struct RoomDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailsScreen(room: Room.rooms[0])
    }
}

struct DeviceCard: View {
    let device: String
    @State private var isOn: Bool = false
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 4) {
                Spacer(minLength: 0)
                Text(device)
                
                Text("Details Settings")
                    .customFont(weight: .regular, size: 12)
                    .lineLimit(1)
                    .foregroundColor(Color.white.opacity(0.5))
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
        .padding()
        .frame(height: 120)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            GeometryReader { proxy in
                Circle()
                    .fill(Color(hex: "A1ABFF").opacity(0.28))
                    .frame(width: 154, height: 154)
                    .blur(radius: 50)
                    .offset(x: proxy.size.width - 95, y: 40)
            }
            .clipped()
        )
        .background(
            ZStack {
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black.opacity(0.31))
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Theme.strokeGradient, lineWidth: 1.5)
            }
        )
        .overlay(
            Image(systemName: "case")
                .resize()
                .aspectRatio(contentMode: .fit)
                .frame(width: 88, height: 88)
                .foregroundColor(Color(hex: "D8B0FF").opacity(0.17))
                .opacity(0.4),
            alignment: .topLeading
        )
    }
}
