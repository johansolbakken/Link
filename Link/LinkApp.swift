//
//  LinkApp.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import SwiftUI

@main
struct LinkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
