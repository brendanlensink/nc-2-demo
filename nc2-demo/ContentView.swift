//
//  ContentView.swift
//  nc2-demo
//
//  Created by Brendan Lensink on 2024-01-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NiceText(style: .sectionTitle, text: "Section Title")

            NiceText(style: .body, text: "Body Text")

            NiceText(style: TextStyle(fontTheme: FontTheme(name: "Comic Sans MS", weight: .heavy, size: 24, tracking: 12), textTheme: TextTheme(color: .red, lineLimit: 1, lineSpacing: 12)), text: "Beep boop")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
