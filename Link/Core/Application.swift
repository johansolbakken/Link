//
//  Core.swift
//  Link
//
//  Created by Johan Solbakken on 31/01/2022.
//

import Foundation
import SwiftUI

class Application {

    static let instance = Application();
    private var menubar = Menubar();
    
    private init() {}
    
    public func initialize() {
        LinkHandler.instance.setStrategy(strategy: HttpLinkStrategy());
        menubar.initialize();
        menubar.setWindowContext(window: NSApplication.shared.windows.first!);
    }
    
}
