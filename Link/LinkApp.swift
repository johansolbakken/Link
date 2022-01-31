//
//  LinkApp.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import SwiftUI

@main
struct LinkApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate;
    @StateObject var persistenceController = PersistenceController();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext);
        }
    }
}

