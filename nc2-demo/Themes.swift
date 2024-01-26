//
//  Theme.swift
//  nc2-demo
//
//  Created by Brendan Lensink on 2024-01-26.
//

import SwiftUI

struct FontTheme {
    let name: String
    let weight: Font.Weight
    let size: CGFloat
    let tracking: CGFloat
    var dynamicTypeMaxSize: DynamicTypeSize?
}

struct TextTheme {
    let color: Color
    let lineLimit: Int
    let lineSpacing: CGFloat
}
