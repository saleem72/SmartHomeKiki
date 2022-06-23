//
//  HomeScreen.swift
//  SmartHomeKiki
//
//  Created by Yousef on 6/22/22.
//

import SwiftUI
import AVKit



class HomeViewModel: ObservableObject {
    
//    @Published var target: NeoMorphisimHomeScreen.Target = .room
    @Published private(set) var rooms = Room.rooms
    @Published private(set) var gotoRoomDetails: Bool = false
    @Published var selectedRoom: Room? = nil
    @Published private(set) var showPlayer: Bool = false
    @Published private(set) var isPlaying: Bool = false
    @Published private(set) var duration: String = "00:00"
    var audioPlayer: AVAudioPlayer?
    
    func showDetails(for room: Room) {
        print(#function, room.title)
        selectedRoom = room
        gotoRoomDetails = true
    }
    
    func toggleShowPlayer() {
        withAnimation(.spring()) {
            showPlayer.toggle()
        }
    }
    
    func setupAudioPlayer() {
        guard let url = Bundle.main.url(forResource: "song1", withExtension: "mp3") else { return }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            duration = player.duration.toString()
            player.play()
            self.isPlaying = true
            self.audioPlayer = player
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}

struct HomeScreen: View {
    
    @StateObject private var viewModel: HomeViewModel = .init()
    
    var body: some View {
        ZStack {
            backgroundLayer
            
            content
        }
        .navigationBarHidden(true)
    }
}

extension HomeScreen {
    private var navLinks: some View {
        VStack {
            if let room = viewModel.selectedRoom {
                NavigationLink(
                    "",
                    destination: RoomDetailsScreen(room: room),
                    tag: room,
                    selection: $viewModel.selectedRoom)
            }
        }
    }
    
    private var content: some View {
        VStack(spacing: 0) {
            header
            
            contentDetails
        }
        .foregroundColor(Theme.text)
        .background(navLinks)
        .overlay(possibleAudioPlayer(), alignment: .bottom)
    }
    
    private var contentDetails: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                weatherSection
                roomsSection
            }
        }
        .padding(.top, 14)
    }
    
    private var backgroundLayer: some View {
        Theme.background
            .edgesIgnoringSafeArea(.all)
            .overlay(garnishCircle, alignment: .topLeading)
    }
    private var garnishCircle: some View {
        Circle()
            .fill(Color(hex: "1371FF").opacity(0.28))
            .frame(width: 178, height: 178)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .topLeading)
            .edgesIgnoringSafeArea(.all)
            .offset(x: -34, y: -88)
            .blur(radius: 60)
    }
    
    private var trackImage: some View {
        ZStack {
            Circle()
            .fill(AngularGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.14166666567325592, green: 0.14166666567325592, blue: 0.14166666567325592, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.7083333134651184, green: 0.7083333134651184, blue: 0.7083333134651184, alpha: 1)), location: 0.1354166716337204),
                .init(color: Color(#colorLiteral(red: 0.14166666567325592, green: 0.14166666567325592, blue: 0.14166666567325592, alpha: 1)), location: 0.265625),
                .init(color: Color(#colorLiteral(red: 0.7083333134651184, green: 0.7083333134651184, blue: 0.7083333134651184, alpha: 1)), location: 0.4166666567325592),
                .init(color: Color(#colorLiteral(red: 0.14166666567325592, green: 0.14166666567325592, blue: 0.14166666567325592, alpha: 1)), location: 0.546875),
                .init(color: Color(#colorLiteral(red: 0.7083333134651184, green: 0.7083333134651184, blue: 0.7083333134651184, alpha: 1)), location: 0.6822916865348816),
                .init(color: Color(#colorLiteral(red: 0.14166666567325592, green: 0.14166666567325592, blue: 0.14166666567325592, alpha: 1)), location: 0.78125),
                .init(color: Color(#colorLiteral(red: 0.7083333134651184, green: 0.7083333134651184, blue: 0.7083333134651184, alpha: 1)), location: 0.875),
                .init(color: Color(#colorLiteral(red: 0.14166666567325592, green: 0.14166666567325592, blue: 0.14166666567325592, alpha: 1)), location: 1)]),
                    center: UnitPoint(x: 0.5, y: 0.49999999999999994)
                  ))

            Circle()
            .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4300000071525574)), lineWidth: 2)
        }
        .frame(width: 28, height: 28)
    }
    
    @ViewBuilder
    private func possibleAudioPlayer() -> some View {
        if viewModel.showPlayer {
            audioPlayer
                .transition(.move(edge: .bottom))
        }
    }
    
    private var audioPlayer: some View {
        VStack {
            HStack(spacing: 12) {
                trackImage
                
                HStack(spacing: 8) {
                    Text("FOLLW HRART")
                        .customFont(weight: .regular, size: 14)
                        .foregroundColor(Color.white.opacity(0.85))
                        .padding(.leading, 12)
                    
                    Text(viewModel.duration)
                        .customFont(weight: .regular, size: 12)
                        .foregroundColor(Color.white.opacity(0.33))
                }
                
                Spacer(minLength: 0)
                
                HStack(spacing: 8) {
                    Button(action: {}, label: {
                        Image(systemName: Asset.System.backward)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                    })
                    .frame(width: 44, height: 44)
                    
                    Button(action: {}, label: {
                        Image(systemName: viewModel.isPlaying ? Asset.System.pause : Asset.System.play)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color.white)
                    })
                    .frame(width: 44, height: 44)
                    
                    Button(action: {}, label: {
                        Image(systemName: Asset.System.forward)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                    })
                    .frame(width: 44, height: 44)
                }
                .foregroundColor(Color(hex: "666666"))
                
            }
            .padding(.top)
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 40)
        .frame(height: 128 + safeAreaInset.bottom)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                CustomCorners(corners: [.topLeft, .topRight], radius: 40)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "131A33"),
                                Color(hex: "131A33").opacity(0.8)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: Color(hex: "3261FF").opacity(0.31), radius: 84, x: 180, y: -3)
                    .shadow(color: Color(hex: "5A33FF").opacity(0.26), radius: 78, x: -93, y: -4)
                
                CustomCorners(corners: [.topLeft, .topRight], radius: 40)
                    .stroke(
                        LinearGradient(colors: Color(hex: "BF8CFF").opacity(0.33), .black),
                        lineWidth: 1
                    )
            }
            
        )
        .onAppear(perform: viewModel.setupAudioPlayer)
    }
    private var roomsSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(Asset.rooms)
                .renderingResize()
                .frame(width: 24, height: 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(viewModel.rooms) { room in
                        RoomCard(room: room)
                            .onTapGesture {
                                viewModel.showDetails(for: room)
                            }
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, 44)
                .padding(.horizontal, 24)
                
            }
        }
        .padding(.horizontal)
    }
    
    
    private var weatherSection: some View {
        HStack {
            WeatherItem(value: "🌦", title: "Rainning")
            WeatherItem(value: "18", unit: "°c", title: "Temp Outside")
            WeatherItem(value: "18", unit: "°c", title: "Temp Indoor")
        }
        .padding()
    }
    
    private var profileButton: some View {
        Button(action: {}, label: {
            Image(Asset.user)
                .resize()
                .frame(width: 32, height: 32)
                .mask(Circle())
                .background(
                    Circle()
                        .shadow(color: Color(hex: "163B75").opacity(0.7), radius: 16, x: 0.0, y: 4)
                )
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.6), lineWidth: 1)
                )
            
        })
    }
    
    private var header: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading) {
                Text("Hi  Kiki")
                    .customFont(.title)
                Text("Welcome to kk'home")
                    .customFont(weight: .light, size: 14)
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                viewModel.toggleShowPlayer()
            }, label: {
                Image(systemName: Asset.System.music)
                    .font(.callout)
                    .frame(width: 32, height: 32)
                    .background(
                        Circle()
                            .fill(LinearGradient(colors: .white, .white))
                            .opacity(0.12)
                    )
            })
            
            profileButton
            
        }
        .padding(.horizontal)
        .frame(height: 80)
        .background(
            Text("Home")
                .customFont(weight: .bold, size: 65)
                .foregroundColor(Color.white.opacity(0.03)),
            alignment: .leading
        )
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreen()
        }
    }
}





