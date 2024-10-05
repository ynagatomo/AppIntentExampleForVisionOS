//
//  Logger.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import OSLog

extension Logger {
    static let intentLogging = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "App Intent")
    static let entityQueryLogging = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Entity Query")
    static let activityTracking = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Activity Tracking")
}
