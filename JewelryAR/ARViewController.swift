//
//  ARViewController.swift
//  JewelryAR
//
//  Created by Maxim Kucherov on 07/05/2022.
//  Copyright (c) 2022 PostIndustria. All rights reserved.
//

import UIKit
import JewelryAR

class ARViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let arView = JewelryARView(frame: view.bounds)
        
        view.addSubview(arView)
        
        view.addConstraints([
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: arView.topAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: arView.bottomAnchor),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: arView.leadingAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: arView.trailingAnchor),
        ])
        
        arView.apiURL = "https://stage-api-ar.postindustria.com/v1"
        arView.apiKey = "spWyH9aA-OEL-Bl27KHAeQ"
        arView.modelID = "73"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

