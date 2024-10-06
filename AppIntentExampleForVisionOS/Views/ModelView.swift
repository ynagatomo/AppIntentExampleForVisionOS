//
//  ModelView.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ModelView: View {
    let sceneName: String
    var body: some View {
        Model3D(named: sceneName, bundle: realityKitContentBundle)
            .padding(.bottom, 50)
    }
}

#Preview {
    ModelView(sceneName: "ToyRobot")
}
