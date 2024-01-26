//
//  Config.swift
//  nc2-demo
//
//  Created by Brendan Lensink on 2024-01-26.
//

import SwiftUI

struct Config {
    static var current: Config = Config()

    var bodyTextStyle: TextStyle
    var detailTextStyle: TextStyle

    var sectionTitleStyle: TextStyle
    var itemTitleStyle: TextStyle

    init(
        bodyTextStyle: TextStyle? = nil,
        detailTextStyle: TextStyle? = nil,
        sectionTitleStyle: TextStyle? = nil,
        itemTitleStyle: TextStyle? = nil
    ) {
        self.bodyTextStyle = bodyTextStyle ?? TextStyle(
            fontTheme: FontTheme(name: "Comic Sans MS", weight: .regular, size: 12, tracking: 12),
            textTheme: TextTheme(color: .black, lineLimit: 1, lineSpacing: 12)
        )

        self.detailTextStyle = detailTextStyle ?? TextStyle(
            fontTheme: FontTheme(name: "Comic Sans MS", weight: .regular, size: 10, tracking: 12),
            textTheme: TextTheme(color: .black, lineLimit: 1, lineSpacing: 12)
        )

        self.sectionTitleStyle = sectionTitleStyle ?? TextStyle(
            fontTheme: FontTheme(name: "Comic Sans MS", weight: .semibold, size: 24, tracking: 12),
            textTheme: TextTheme(color: .black, lineLimit: 1, lineSpacing: 12)
        )

        self.itemTitleStyle = itemTitleStyle ?? TextStyle(
            fontTheme: FontTheme(name: "Comic Sans MS", weight: .semibold, size: 16, tracking: 12),
            textTheme: TextTheme(color: .black, lineLimit: 1, lineSpacing: 12)
        )
    }
}
