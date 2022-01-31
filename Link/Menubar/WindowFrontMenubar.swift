//
//  WindowFrontMenubar.swift
//  Link
//
//  Created by Johan Solbakken on 31/01/2022.
//

import Foundation
import AppKit

/// Makes the MenuBar get window to front when clicked.
///
/// A concrete implementation of the MenubarImpl.
public class WindowFrontMenubar: MenubarImpl {
    
    /// The window context.
    private var m_WindowContext: NSWindow?;
    
    /// Status bar.
    ///
    /// A context to communicate with the menu bar.
    private var m_StatusBarContext: NSStatusBar?;
    
    /// Status item.
    ///
    /// A context for communicating with the menu item.
    private var m_StatusItemContext: NSStatusItem?;
    
    
    override init(menubarStrategy: MenubarStrategy = BringFrontStrategy()) {
        super.init(menubarStrategy: menubarStrategy);
    }
    
    public override func initializeImpl() {
        super.initializeImpl();
        
        m_StatusBarContext = NSStatusBar.init();
        m_StatusItemContext = m_StatusBarContext?.statusItem(withLength: 28.0);
        
        if let statusBarButton = m_StatusItemContext?.button {
            statusBarButton.image = NSImage(systemSymbolName: "link", accessibilityDescription: "");
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0);
            statusBarButton.image?.isTemplate = true;
            statusBarButton.target = self;
            statusBarButton.action = #selector(statusItemClicked(sender:))
        }
    }
    
    public override func setWindowContextImpl(window: NSWindow) {
        m_WindowContext = window;
    }
    
    /// Callback function for when status item is clicked.
    ///
    /// - Parameter sender: The object that performed the call.
    @objc private func statusItemClicked(sender: AnyObject) {
        m_Strategy.windowAction(window: m_WindowContext!);
    }
}
