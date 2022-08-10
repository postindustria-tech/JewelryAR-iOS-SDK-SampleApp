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
    let modelID: String?
    
    @State var arSceneState: ARSceneState?
    
    var body: some View {
        ZStack {
            JewelryARView(apiURL: "https://stage-api-ar.postindustria.com/v1",
                          apiKey: "spWyH9aA-OEL-Bl27KHAeQ",
                          modelID: modelID,
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
            if let progress = arSceneState?.ringStates?.downloadOperations?.first(where: { $0.tag == modelID })?.progress
            {
                HStack {
                    Spacer()
                    Text("Ring model download: \(progress * 100)%")
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Text("Pending: \(String(describing: arSceneState?.ringStates?.pendingReplacement?.modelID))")
                Spacer()
            }
            HStack {
                Spacer()
                Text("Displayed: \(String(describing: arSceneState?.ringStates?.displayedRing?.modelID))")
                Spacer()
            }
        }
        .padding()
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView(modelID: "1")
        ARView(modelID: nil)
    }
}
