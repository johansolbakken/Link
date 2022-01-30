//
//  StatusBarController.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import Foundation
import AppKit
import SwiftUI

class StatusBarController: ObservableObject {
    private var statusBar: NSStatusBar?;
    private var statusItem: NSStatusItem?;
    private var hidden = false;
    private var isInit = false;
    
    func initialize() {
        statusBar = NSStatusBar.init();
        statusItem = statusBar?.statusItem(withLength: 28.0);
        
        if let statusBarButton = statusItem?.button {
            statusBarButton.image = NSImage(systemSymbolName: "link", accessibilityDescription: "");
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0);
            statusBarButton.image?.isTemplate = true;
            statusBarButton.target = self;
            statusBarButton.action = #selector(toggleHidden(sender:))
        }
    }
    
    @objc func toggleHidden(sender: AnyObject) {
        hidden = !hidden;
    }
    
    func getHidden() -> Bool {
        if (!isInit) {initialize();}
        return hidden;
    }
}
