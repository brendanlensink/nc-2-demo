//
//  nc2_demoApp.swift
//  nc2-demo
//
//  Created by Brendan Lensink on 2024-01-26.
//

import SwiftUI

@main
struct nc2_demoApp: App {
    init() {
        var newConfig = Config()
        newConfig.bodyTextStyle = TextStyle(
            fontTheme: FontTheme(name: "Comic Sans MS", weight: .regular, size: 12, tracking: 12),
            textTheme: TextTheme(color: .blue, lineLimit: 1, lineSpacing: 12)
        )

        Config.current = newConfig
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
