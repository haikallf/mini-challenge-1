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
        PreAuthIntro(id: 1, text: "Stay connected with your friends and never miss out on a hangout again.", filename: "1"),
        PreAuthIntro(id: 2, text: "Schedule events, invite friends, and let us tell your friends when you arrived.", filename: "2"),
        PreAuthIntro(id: 3, text: "Plus, capture your hangout moment with just a shake of your phone.", filename: "3"),
        
    ]
}
