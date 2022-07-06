//
//  main.swift
//  JewelryAR_Example
//
//  Created by Maxim Kucherov on 05.07.2022.
//  Copyright © 2022 PostIndustria. All rights reserved.
//

import UIKit
import JewelryAR

InitArgs(CommandLine.argc, CommandLine.unsafeArgv)

_ = UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(
            to: UnsafeMutablePointer<Int8>.self,
            capacity: Int(CommandLine.argc)),
    nil,
    NSStringFromClass(AppDelegate.self)
)
