//
//  Schedule.swift
//  FridGet
//
//  Created by Gaizka Valencia on 02/05/23.
//

import Foundation

struct User: Codable, Hashable{
    let email: String
    let fullname: String
}

struct Schedule: Codable, Hashable{
    let id: Int
    let created_at: String
    let user: User
    let nama: String
    let latitude: String
    let longitude: String
    let alamat: String
    let namatempat: String
    let tanggal: String
    let waktu: String
    let status_schedule: String
    let note: String
}

struct ScheduleMember: Codable, Hashable{
    let id: Int
    let schedule: Schedule
    let member: User
    let created_at: String
    let status_member: String
}
