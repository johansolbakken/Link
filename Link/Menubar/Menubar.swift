//
//  StatusBarController.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import Foundation
import AppKit

/// A general Menubar.
///
/// Abstract class mimic. Abstraction in bridge pattern.
public class Menubar {
    private let m_Impl: MenubarImpl;
    
    init(_ impl: MenubarImpl = WindowFrontMenubar()) {
        m_Impl = impl;
    }
    
    /// Initializes subsystems for the Menubar.
    ///
    /// Can only be called once. Will not throw.
    public func initialize() {
        m_Impl.initializeImpl();
    }
    
    /// Sets the context to which the menubar will act on.
    ///
    /// - Parameter window: The window context.
    public func setWindowContext(window: NSWindow) {
        m_Impl.setWindowContextImpl(window: window);
    }
    
}
