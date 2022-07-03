//
//  EcoDoApp.swift
//  EcoDo
//
//  Created by YesVladess on 03.07.2022.
//

import SwiftUI

@main
struct EcoDoApp: App {

    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
    
}
