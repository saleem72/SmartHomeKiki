//
//  Room.swift
//  AboShaker
//
//  Created by Yousef on 3/31/22.
//

import Foundation

struct Room: Identifiable, Hashable {
    var id: String { title }
    var title: String
    
    var devices: [String]
    var controlled: Bool
    var temperature: Double
    var outTemperature: Double
    var humidity: Int
    var image: String
    var isActive: Bool
}

/*
 guestsRoom
 pathRoom
 */

extension Room {
    static var rooms: [Room] = [
        Room(
            title: "Living Room",
            devices: [
                "Bed Light",
                "Turbo Ac",
                "Smart cam"
            ],
            controlled: true,
            temperature: 22,
            outTemperature: 9,
            humidity: 49,
            image: "livingRoom",
            isActive: true
        ),
        Room(
            title: "Kids Room",
            devices: [
                "TV",
                "Air Conditioner",
                "Lights"
            ],
            controlled: true,
            temperature: 22,
            outTemperature: 9,
            humidity: 49,
            image: "kidsRoom",
            isActive: false
        ),
        Room(
            title: "Bed Room",
            devices: [
                "TV",
                "Air Conditioner",
                "Lights"
            ],
            controlled: true,
            temperature: 22,
            outTemperature: 9,
            humidity: 49,
            image: "bedRoom",
            isActive: true
        ),
        Room(
            title: "Guests Room",
            devices: [
                "TV",
                "Air Conditioner",
                "Lights"
            ],
            controlled: true,
            temperature: 22,
            outTemperature: 9,
            humidity: 49,
            image: "guestsRoom",
            isActive: false
        ),
        Room(
            title: "Kitchen",
            devices: [
                "Fredge",
                "Oven",
                "Washer"
            ],
            controlled: true,
            temperature: 22,
            outTemperature: 9,
            humidity: 49,
            image: "kitchen",
            isActive: false
        ),
        Room(
            title: "Path Room",
            devices: [
                "Fredge",
                "Oven",
                "Washer"
            ],
            controlled: true,
            temperature: 22,
            outTemperature: 9,
            humidity: 49,
            image: "pathRoom",
            isActive: false
        )
        
    ]
}
