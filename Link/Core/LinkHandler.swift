//
//  LinkHandler.swift
//  Link
//
//  Created by Johan Solbakken on 31/01/2022.
//

import Foundation
import AppKit

/// Singleton for handling links.
public class LinkHandler {
    static let instance = LinkHandler();
    private var m_Strategy: LinkStrategy;
    
    private init() {
        m_Strategy = StandardLinkStrategy();
    }
    
    /// Setting the strategy for formatting the link.
    public func setStrategy(strategy: LinkStrategy) {
        m_Strategy = strategy;
    }
    
    /// Opening a link in the default browser.
    ///
    /// - Parameter link: The link to be opened.
    public func openUrl(link: LinkObj) {
        let url = URL(string:  m_Strategy.format(url: link.url))!;
        NSWorkspace.shared.open(url);
    }
}

/// Strategy for formatting links.
public protocol LinkStrategy {
    
    /// Formatting a url.
    func format(url: String) -> String;
}

/// Standard link strategy.
public class StandardLinkStrategy: LinkStrategy {
    public func format(url: String) -> String {
        return url;
    }
}

/// Strategy for formating urls to http type.
public class HttpLinkStrategy: LinkStrategy {
    public func format(url: String) -> String {
        if (!url.contains("http://") && !url.contains("https://")) {
            return "http://" + url;
        }
        return url;
    }
}
