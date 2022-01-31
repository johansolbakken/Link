//
//  MenubarImpl.swift
//  Link
//
//  Created by Johan Solbakken on 31/01/2022.
//

import Foundation
import AppKit

/// Implementing the Menubar abstraction.
///
/// Abstraction class mimic.
/// Implementor in bridge pattern.
public class MenubarImpl {
    internal var m_Strategy: MenubarStrategy;
    private var m_IsInitialized = false;
    
    init(menubarStrategy: MenubarStrategy) {
        m_Strategy = menubarStrategy;
    }
    
    /// General implementation for initializing a general Menubar.
    public func initializeImpl() {
        if (m_IsInitialized) {return;}
        m_IsInitialized = true;
    }
    
    /// General implementation for setting a window context.
    public func setWindowContextImpl(window: NSWindow) {
        
    }    
    
}
