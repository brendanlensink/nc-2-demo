//
//  Styles.swift
//  nc2-demo
//
//  Created by Brendan Lensink on 2024-01-26.
//

import SwiftUI

struct TextStyle {
    let fontTheme: FontTheme
    let textTheme: TextTheme
}

extension TextStyle {
    static var body: TextStyle {
        Config.current.bodyTextStyle
    }

    static var sectionTitle = TextStyle(
        fontTheme: FontTheme(name: "Comic Sans MS", weight: .heavy, size: 30, tracking: 12),
        textTheme: TextTheme(color: .black, lineLimit: 1, lineSpacing: 12)
    )
}
