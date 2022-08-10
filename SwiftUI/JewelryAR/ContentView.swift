//
//  ContentView.swift
//  JewelryAR
//
//  Created by Maxim Kucherov on 25.07.2022.
//

import SwiftUI

struct ContentView: View {
    struct ModelInfo: Identifiable {
        var id: String
    }
    
    var body: some View {
        NavigationView {
            List(["73", "74", "75", "76", "1", "2", "345", "346", "347", "348", "349"].map(ModelInfo.init)) { modelInfo in
                NavigationLink {
                    ARView(modelID: modelInfo.id)
                        .navigationTitle("Model #\(modelInfo.id)")
                } label: {
                    Text("Open AR - model #\(modelInfo.id)")
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
