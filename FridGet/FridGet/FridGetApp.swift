//
//  FridGetApp.swift
//  FridGet
//
//  Created by Gaizka Valencia on 14/04/23.
//

import SwiftUI

@main
struct FridGetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
