//
//  ItemView.swift
//  AppIntentExampleForVisionOS
//
//  Created by Yasuhito Nagatomo on 2024/10/06.
//

import SwiftUI

struct ItemView: View {
    let imageName: String
    let sceneName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .contentShape(RoundedRectangle(cornerRadius: 20.0))
            .padding(.horizontal, 16)

        Text(sceneName)
            .font(.headline)
    }
}

#Preview {
    ItemView(imageName: "ToyRobot", sceneName: "Toy Robot")
}
