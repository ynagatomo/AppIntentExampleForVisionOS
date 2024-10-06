//
//  ContentView.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var appModel

    var body: some View {
        VStack {
            switch appModel.showingView {
            case .menu: MenuView()
            case .scene(let property):
                ModelContentView(sceneProperty: property)
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AppModel())
}
