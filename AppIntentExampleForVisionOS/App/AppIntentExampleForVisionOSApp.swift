//
//  AppIntentExampleForVisionOSApp.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import SwiftUI

@main
struct AppIntentExampleForVisionOSApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        .windowStyle(.plain)
        .windowResizability(.contentSize)

        WindowGroup(id: "ModelView", for: String.self) { $sceneName in
            ModelView(sceneName: sceneName ?? "ToyRobot")
                .environment(appModel)
        }
        .windowStyle(.volumetric)
     }
}
