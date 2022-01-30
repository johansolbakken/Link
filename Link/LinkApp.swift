//
//  LinkApp.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import SwiftUI

@main
struct LinkApp: App {
    @StateObject var persistenceController = PersistenceController();
    @StateObject var statusBarController = StatusBarController();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext)
                .environment(\.statusBarController, statusBarController);
        }
    }
}
