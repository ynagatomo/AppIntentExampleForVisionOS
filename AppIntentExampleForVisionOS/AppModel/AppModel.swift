//
//  AppModel.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {

    struct SceneProperty: Identifiable {
        // swiftlint:disable nesting
        // swiftlint:disable type_name
        typealias ID = String
        // swiftlint:enable nesting
        var id: String { name }
        // swiftlint:enable type_name
        let name: String    // Item name
        let sceneName: String // Scene name
        let imageName: String // Thumbnail image name

        static let sample: Self = .init(name: "Toy Robot", sceneName: "ToyRobot", imageName: "ToyRobot")
    }

    enum ShowingView {
        case menu, scene(property: SceneProperty)
    }

    var showingView: ShowingView = .menu
    let scenes: [SceneProperty] = [
        SceneProperty(name: "Toy Robot", sceneName: "ToyRobot", imageName: "ToyRobot"),
        SceneProperty(name: "Toy Car", sceneName: "ToyCar", imageName: "ToyCar")
    ]

    func showMenu() {
        self.showingView = .menu
    }

    func showScene(id: SceneProperty.ID) {
        print("** showScene() called with id: \(id)")
        if let property = scenes.first(where: { $0.id == id }) {
            self.showingView = .scene(property: property)
            print("** showScene() succeeded")
        }
    }
}
