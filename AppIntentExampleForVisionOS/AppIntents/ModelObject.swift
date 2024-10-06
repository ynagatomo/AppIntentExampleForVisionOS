//
//  ModelObject.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import AppIntents
import OSLog

enum ModelObject: String, Codable, Sendable {
    case toyRobot = "Toy Robot"
    case toyCar = "Toy Car"

    /// The string name for an SF Symbol representing the value.
    var symbol: String {
        switch self {
        case .toyRobot: "figure.arms.open"
        case .toyCar: "car.side.fill"
        }
    }
}

extension ModelObject: AppEnum {
    /**
     A localized name representing this entity as a concept people are familiar with in the app, including
     localized variations based on the plural rules the app defines in `AppIntents.stringsdict`, referenced here
     through the `table` parameter. The system may show this value to people when they configure an intent.
     */
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(
            name: LocalizedStringResource("Model Object", table: "AppIntents"),
            numericFormat: LocalizedStringResource("\(placeholder: .int) objects", table: "AppIntents")
        )
    }

    /// Localized names for each case that the enum defines.
    /// The system shows these values to people when they configure or use an intent.
    static let caseDisplayRepresentations: [ModelObject: DisplayRepresentation] = [
        .toyRobot: DisplayRepresentation(title: "Toy Robot",
                                    subtitle: "",
                                         image: imageRepresentation[.toyRobot]),
        .toyCar: DisplayRepresentation(title: "Toy Car",
                                    subtitle: "",
                                         image: imageRepresentation[.toyCar])]

    /// An image for the activity that appears in Spotlight
    /// and when the system asks people to provide a parameter value in an intent.
    private static let imageRepresentation: [ModelObject: DisplayRepresentation.Image] = [
        .toyRobot: DisplayRepresentation.Image(systemName: ModelObject.toyRobot.symbol),
        .toyCar: DisplayRepresentation.Image(systemName: ModelObject.toyCar.symbol)
    ]
}

extension Array where Element == ModelObject {
    /// Flattens an array of activities to a formatted string.
    var formattedDisplayValue: String {
        let objects: [String] = compactMap { object in
            guard let objectName = ModelObject.caseDisplayRepresentations[object] else {
                return nil
            }
            return String(localized: objectName.title)
        }
        return objects.joined(separator: ", ")
    }
}
