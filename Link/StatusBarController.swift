//
//  StatusBarController.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import Foundation
import AppKit
import SwiftUI

class StatusBarController {
    private var statusBar: NSStatusBar?;
    private var statusItem: NSStatusItem?;
    private var window: NSWindow?;
    
    func initialize() {
        statusBar = NSStatusBar.init();
        statusItem = statusBar?.statusItem(withLength: NSStatusItem.variableLength);
        
        if let statusBarButton = statusItem?.button {
            statusBarButton.image = NSImage(systemSymbolName: "link", accessibilityDescription: "");
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0);
            statusBarButton.image?.isTemplate = true;
            statusBarButton.target = self;
            statusBarButton.action = #selector(toggleHidden(sender:))
        }
    }
    
    @objc func toggleHidden(sender: AnyObject) {
        window?.orderFrontRegardless();
    }
    
    func setWindow(window: NSWindow) {
        self.window = window;
    }
}
