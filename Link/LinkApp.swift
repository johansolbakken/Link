//
//  LinkApp.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var menubar = Menubar();
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        menubar.initialize();
        
        if let window = NSApplication.shared.windows.first {
            menubar.setWindowContext(window: window);
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

