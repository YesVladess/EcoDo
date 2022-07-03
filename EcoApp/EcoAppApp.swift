//
//  EcoAppApp.swift
//  EcoApp
//
//  Created by YesVladess on 03.07.2022.
//

import SwiftUI

@main
struct EcoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
