//
//  PreAuthIntro.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 29/04/23.
//

import SwiftUI

struct PreAuthIntro: Equatable {
    let id: Int
    let text: String
    let filename: String
}

extension PreAuthIntro {
    static let all = [
        PreAuthIntro(id: 1, text: "Stay connected with your friends and never miss out on a hangout again.", filename: "illustration-1"),
        PreAuthIntro(id: 2, text: "Scheduled events, invite friends, and let us handle the rest with automatic location updates.", filename: "illustration-2")
    ]
}
