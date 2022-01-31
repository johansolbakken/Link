//
//  LinkApp.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarController = StatusBarController();
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusBarController.initialize();
        
        if let window = NSApplication.shared.windows.first {
            statusBarController.setWindow(window: window);
        }
    }
}

@main
struct LinkApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate;
    @Environment(\.scenePhase) var scenePhase;
    
    @StateObject var persistenceController = PersistenceController();
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext);
                
        }
    }
}

