//
//  ARView.swift
//  JewelryAR_Example
//
//  Created by Maxim Kucherov on 01.08.2022.
//

import SwiftUI
import JewelryAR
import JewelryAR_SwiftUI

struct ARView: View {
    let model: ModelRef?
    
    @State var arSceneState: ARSceneState?
    
    var body: some View {
        ZStack {
            JewelryARView(apiURL: "https://stage-api-ar.postindustria.com/v1",
                          apiKey: "spWyH9aA-OEL-Bl27KHAeQ",
                          modelID: model?.modelID,
                          modelCustomID: model?.customID,
                          modelName: model?.name,
                          arSceneState: $arSceneState)
            overlay
        }
    }
    
    private var overlay: some View {
        VStack {
            Spacer()
            if let operation = arSceneState?.handDetectorState?.downloadOperations?.first,
               let tag = operation.tag,
               let progress = operation.progress
            {
                HStack {
                    Spacer()
                    Text("TF download (\(tag)): \(progress * 100)%")
                    Spacer()
                }
            }
            if let model = model,
                let modelOperations = arSceneState?.ringStates?.downloadOperations,
               let progress = modelOperations.first(where: { $0.model.canBeUsedAs(modelRef: model) == true })?.progress
            {
                HStack {
                    Spacer()
                    Text("Ring model download: \(progress * 100)%")
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Text("Pending: \(arSceneState?.ringStates?.pendingReplacement?.model?.id ?? "nil")")
                Spacer()
            }
            HStack {
                Spacer()
                Text("Displayed: \(arSceneState?.ringStates?.displayedRing?.model?.id ?? "nil")")
                Spacer()
            }
        }
        .padding()
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView(model: ModelRef(modelID: "1"))
        ARView(model: nil)
    }
}
