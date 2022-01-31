//
//  AppDelegate.swift
//  Link
//
//  Created by Johan Solbakken on 31/01/2022.
//

import Foundation
import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        Application.instance.initialize();
    }
}
