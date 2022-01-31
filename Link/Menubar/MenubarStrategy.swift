//
//  MenubarStrategy.swift
//  Link
//
//  Created by Johan Solbakken on 31/01/2022.
//

import Foundation
import AppKit

/// Defines the behaviour of the Menubar.
public protocol MenubarStrategy {
    /// Action performed on window.
    func windowAction(window: NSWindow);
}

/// Brings window to front of the screen.
class BringFrontStrategy: MenubarStrategy {
    
    func windowAction(window: NSWindow) {
        window.orderFrontRegardless();
    }
    
}
