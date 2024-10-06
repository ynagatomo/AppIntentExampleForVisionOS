//
//  AppIntentExampleForVisionOSApp.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import AppIntents
import SwiftUI

@main
struct AppIntentExampleForVisionOSApp: App {
    private let appModel: AppModel

    init() {
        let appModel = AppModel()
        self.appModel = appModel

        /**
         Register important objects that are required as dependencies of an `AppIntent` or an `EntityQuery`.
         The system automatically sets the value of properties in the intent or entity query to these values
         when the property is annotated with
         `@Dependency`. Intents that launch the app in the background won't have associated UI scenes,
         so the app must register these values as soon as possible in code paths that don't assume visible UI,
         such as the `App` initialization.
         */
        AppDependencyManager.shared.add(dependency: appModel)
    }

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
