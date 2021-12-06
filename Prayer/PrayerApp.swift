//
//  PrayerApp.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import SwiftUI

@main
struct PrayerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
