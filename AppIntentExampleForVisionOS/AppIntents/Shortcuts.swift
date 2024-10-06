//
//  Shortcuts.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import AppIntents

/**
 An `AppShortcut` wraps an intent to make it automatically discoverable throughout the system.
 An `AppShortcutsProvider` manages the shortcuts the app
 makes available. The app can update the available shortcuts by calling `updateAppShortcutParameters()` as needed.
 */
class Shortcuts: AppShortcutsProvider {

    /// The color the system uses to display the App Shortcuts in the Shortcuts app.
    static let shortcutTileColor = ShortcutTileColor.grayBlue

    /**
     This app contains several examples of different intents, but only the intents this array
     describes make sense as App Shortcuts.
     Put the App Shortcut most people will use as the first item in the array. This first shortcut shouldn't
     bring the app to the foreground.

     Every phrase that people use to invoke an App Shortcut needs to contain the app name,
     using the `applicationName` placeholder in the provided
     phrase text, as well as any app name synonyms declared in the `INAlternativeAppNames` key
     of the app's `Info.plist` file. These phrases are
     localized in a string catalog named `AppShortcuts.xcstrings`.
     */
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: ShowModelIntent(), phrases: [
            "Show a \(\.$modelObject) with \(.applicationName)",
            "Show the \(\.$modelObject) with \(.applicationName)",
            "Show a model with \(.applicationName)",
            "Show a 3d model with \(.applicationName)",
            "Show models with \(.applicationName)",
            "Show 3d models with \(.applicationName)",
            "Display a \(\.$modelObject) with \(.applicationName)",
            "Display the \(\.$modelObject) with \(.applicationName)",
            "Display a model with \(.applicationName)",
            "Display a 3d model with \(.applicationName)",
            "Display models with \(.applicationName)",
            "Display 3d models with \(.applicationName)"
        ],
        shortTitle: "Show a 3d model",
        systemImageName: "view.3d")
    }
}
