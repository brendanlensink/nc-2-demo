//
//  NiceText.swift
//  nc2-demo
//
//  Created by Brendan Lensink on 2024-01-26.
//

import SwiftUI

struct NiceText: View {
    let style: TextStyle
    let text: String

    init(style: TextStyle, text: String) {
        self.style = style
        self.text = text
    }

    var body: some View {
        Text(text)
            .foregroundStyle(style.textTheme.color)
            .scaledFont(
                name: style.fontTheme.name,
                size: style.fontTheme.size,
                weight: style.fontTheme.weight,
                maxSize: style.fontTheme.dynamicTypeMaxSize
            )
            .fixedSize(horizontal: false, vertical: true)
    }
}
