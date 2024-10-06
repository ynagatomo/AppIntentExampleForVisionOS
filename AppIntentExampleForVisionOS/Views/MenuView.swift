//
//  ContentView.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MenuView: View {
    @Environment(AppModel.self) private var appModel

    var body: some View {
        VStack {
            Text("AppIntent Example for visionOS")
                .font(.largeTitle)

            VStack {
                Text("Let' say")
                    .font(.title)
                    .padding(4)
                Text("\"Hey Siri! Show a Toy Robot with AppIntentExampleForVisionOS\"")
                    .font(.title)
                    .padding(4)
                Text("or")
                Text("\"Hey Siri! Show a Toy Car with AppIntentExampleForVisionOS\"")
                    .font(.title)
                    .padding(4)
            }
            .padding(.horizontal, 40)
            .background(.thickMaterial, in: .rect(cornerRadius: 40))
            .padding(40)

            HStack {
                ForEach(appModel.scenes) { scene in
                    VStack {
                        ItemView(imageName: scene.imageName, sceneName: scene.sceneName)
                        .hoverEffect()
                        .onTapGesture {
                            appModel.showScene(id: scene.id)
                        }
                    }
                }
            } // HStack
        } // VStack
        .frame(width: 800, height: 800)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 800 - 5, height: 800 - 5)
        }
    }
}

#Preview(windowStyle: .automatic) {
    MenuView()
        .environment(AppModel())
}
