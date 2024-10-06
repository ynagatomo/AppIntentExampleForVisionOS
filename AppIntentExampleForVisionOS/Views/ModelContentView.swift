//
//  ModelContentView.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import SwiftUI

struct ModelContentView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.openWindow) private var openWindow
    // @Environment(\.dismissWindow) private var dismissWindow

    let sceneProperty: AppModel.SceneProperty

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    appModel.showMenu()
                }, label: {
                    Text("Back to Menu")
                        .font(.headline)
                })

                Spacer()
            } // HStack
            .padding(.leading, 40)

            Text(sceneProperty.name)
                .font(.largeTitle)
                .padding(20)

            ItemView(imageName: sceneProperty.imageName,
                     sceneName: sceneProperty.sceneName)

            Button(action: {
                openModelView(sceneName: sceneProperty.sceneName)
            }, label: {
                Text("Display Model")
                    .font(.title)
                    .padding(20)
            })
        } // VStack
        .padding(20)
        .frame(width: 600, height: 600)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 600 - 5, height: 600 - 5)
        }
        // .onAppear {
        //    openModelView(sceneName: sceneProperty.sceneName)
        // }
    }

    private func openModelView(sceneName: String) {
        openWindow(id: "ModelView", value: sceneName)
    }
}

#Preview {
    ModelContentView(sceneProperty: AppModel.SceneProperty.sample)
        .environment(AppModel())
}
