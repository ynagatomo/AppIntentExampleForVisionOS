//
//  ShowModelIntent.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import AppIntents
import OSLog

struct ShowModelIntent: AppIntent {
    // [required]
    /// The intent's title, which the app displays throughout the system.
    static let title: LocalizedStringResource = "Show a 3D model"

    // [optional]
    /**
     The Shortcuts app displays the description to the user. The optional `categoryName` parameter
     allows you to group your app's related
     intents. The optional `searchKeywords` parameter helps people find your intent when searching
     for it in the Shortcuts app.
     */
    static let description = IntentDescription("Shows a 3D model.",
                                               categoryName: "3D Model Showing",
                                               searchKeywords: ["3d model"])

    /// A sentence describing the intent's configuration, visible in the Shortcuts app.
    static var parameterSummary: some ParameterSummary {
        Summary("Show a model of \(\.$modelObject)")
    }

    // By default, the system launches your app in a limited mode in the background
    // and executes the intent’s perform() method on an arbitrary queue.
    // To override this behavior and launch the app in the foreground,
    // set the intent’s openAppWhenRun variable to true. If your intent updates the app’s user interface,
    // annotate perform() with @MainActor to make sure the method executes on the main queue.
    static let openAppWhenRun: Bool = true

    // If you define a variable as a non-optional type, the system knows the parameter is required and,
    // when necessary, requests a value. Conversely, if you define a variable as an optional type,
    // the system assumes the parameter is optional and doesn’t request a value.
    @Parameter(title: "3D Model", description: "The 3D model to be shown.")
    var modelObject: ModelObject // a required parameter

    @Dependency
    private var appModel: AppModel

    // To provide your intent’s functionality, implement the perform() protocol requirement.
    // The system invokes this method after it resolves any required parameters,
    // meaning those parameters are safe for your code to access from the function’s body.
    @MainActor
    func perform() async throws -> some IntentResult {
        Logger.activityTracking.debug("** ShowModelIntent: perform() is called.")

        appModel.showScene(id: modelObject.rawValue)

        /**
         To configure an intent for the Action button, you can either return from the intent with a result
         containing the `actionButtonIntent` parameter, or you can donate the intent
         for the Action button, which occurs in `startNewActivity(_:,on:)`.
         */
        return .result()
    }
}
