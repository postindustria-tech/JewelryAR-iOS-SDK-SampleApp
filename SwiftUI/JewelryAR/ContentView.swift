//
//  ContentView.swift
//  JewelryAR
//
//  Created by Maxim Kucherov on 25.07.2022.
//

import SwiftUI
import JewelryAR

struct ContentView: View {
    static let allModels = ["73"].map { ModelRef(modelID: $0) }
    
    var body: some View {
        NavigationView {
            List(Self.allModels) { modelRef in
                NavigationLink {
                    ARView(model: modelRef)
                        .navigationTitle("Model #\(modelRef.id)")
                } label: {
                    Text("Open AR - model \(modelRef.id)")
                }
            }
            .navigationTitle("Root View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
