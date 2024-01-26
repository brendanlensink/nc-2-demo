//
//  Helper.swift
//  nc2-demo
//
//  Created by Brendan Lensink on 2024-01-26.
//

import SwiftUI

extension View {
    /*
     * Set a view's font property using the provided scaled font.
     *
     * - Parameters
     *      - name: The name of the font to use.
     *      - size: The size of the font you'd like to use as a base
     *      - weight: The weight of the font to use. Default is `nil`.
     *      - maxSize: The max DynamicTypeSize to scale to. Default is `nil`.
     *
     * - Returns: The font, scaled to the correct size
     */
    public func scaledFont(name: String?, size: CGFloat, weight: Font.Weight?, maxSize: DynamicTypeSize? = nil) -> some View {
        return self.modifier(ScaledFont(name: name, weight: weight ?? .regular, size: size, maxSize: maxSize))
    }
}

/// Set the Font for a view while respecting Dynamic Type sizing and styling.
/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-dynamic-type-with-a-custom-font
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String?
    var weight: Font.Weight
    var size: CGFloat
    var maxSize: DynamicTypeSize?

    public func body(content: Content) -> some View {
        return content.font(.scaledFont(name: name, size: size, weight: weight, maxSize: maxSize))
    }
}

extension Font {
    /*
     * Create a new scaled font, given a base font, size and weight.
     *
     * - Parameters
     *      - name: The name of the font to use.
     *      - size: The size of the font you'd like to use as a base
     *      - weight: The weight of the font to use. Default is `nil`.
     *      - maxSize: The max DynamicTypeSize to scale to. Default is `nil`.
     *
     * - Returns: The font, scaled to the correct size
     */
    static func scaledFont(name: String?, size: CGFloat, weight: Font.Weight? = nil, maxSize: DynamicTypeSize? = nil) -> Font {
        var scaledSize = UIFontMetrics.default.scaledValue(for: size)

        if let maxFontSize = maxSize?.getMaxFontSize(for: size) {
            scaledSize = min(maxFontSize, scaledSize)
        }
        if let name = name {
            return Self.custom(name, size: scaledSize)
        }

        return Font.system(size: scaledSize, weight:  weight ?? .regular)
    }
}

extension DynamicTypeSize {
    /**
     * Gets the max font size for a given base size, based on the given dynamic type size.
     * Max size was determined based off the iOS scaling logic given [here](https://developer.apple.com/design/human-interface-guidelines/foundations/typography/#dynamic-type-sizes)
     *
     * - parameter baseSize: The original size of the font to be scaled
     *
     * - returns: The new scaled font size.
     */
    func getMaxFontSize(for baseSize: CGFloat) -> CGFloat? {
        var resultSize: CGFloat = baseSize

        switch self {
        case .xSmall:
            resultSize = baseSize - 3.0
        case .small:
            resultSize = baseSize - 2.0
        case .medium:
            resultSize = baseSize - 1.0
        case .large:
            resultSize = baseSize
        case .xLarge:
            resultSize = baseSize + 2.0
        case .xxLarge:
            resultSize = baseSize + 4.0
        case .xxxLarge:
            resultSize = baseSize + 6.0
        case .accessibility1:
            resultSize = baseSize + 10.0
        case .accessibility2:
            resultSize = baseSize + 14.0
        case .accessibility3:
            resultSize = baseSize + 18.0
        case .accessibility4:
            resultSize = baseSize + 22.0
        case .accessibility5:
            resultSize = baseSize + 26.0
        @unknown default:
            return nil
        }

        if resultSize < 11.0 {
            return 11.0
        }

        return resultSize
    }
}

