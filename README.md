# Jewelry AR SDK SampleApp

## Running the Sample App project

Simply run `pod install` and launch the app from `JewelryAR.xcworkspace` (both -- in the directory of a specific sample).

---

## Integrating Jewelry AR SDK into an existing project

### 0. Start using CocoaPods

```bash
pod init
```

Find more info at [[Getting Started]](https://guides.cocoapods.org/using/getting-started.html).

### 1. Update your project to target iOS `12.0` or newer

### 2. Modify `Podfile` to match your target iOS version

```ruby
platform :ios, '12.0'
```

### 3. Add `JewelryAR` dependency to `Podfile`

#### - Add sources

```ruby
source 'https://read_ios_token_2:ZJ8CH9npP4Ar4ZD2bxzS@gitlab.postindustria.com/ar-ring/jewelry-ar-sdk-ios-cocoapods-podspecs.git'
```

You may need to also add an explicit declaration of CocoaPods CDN source:

```ruby
source 'https://cdn.cocoapods.org/'
```

#### - Declare a dependency in your  target's block

```ruby
pod 'JewelryAR'
```

:exclamation: There is also an optional SwiftUI wrapper available:

```ruby
pod 'JewelryAR-SwiftUI'
```

### 4. Install pods

```bash
pod install
```

### 5. Add camera usage description to your project's `Info.plist`

```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is required to provide AR experience</string>
```

### 6. Call `InitArgs` from the `main` function of your appication

#### (a) If your app is in Swift and has no `main.swift` file

##### - Remove `@main` attribute from `AppDelegate` class

```diff
-@main
 class AppDelegate: UIResponder, UIApplicationDelegate {
```

##### - Create `main.swift` file (and call `UIApplicationMain`)

Swift 4.2 / Swift 5:

```swift
import UIKit
import JewelryAR

InitArgs(CommandLine.argc, CommandLine.unsafeArgv)

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
```

Swift 4:

```swift
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
```

#### (b) If your app is in SwiftUI and has no `main.swift` file

:warning: While following the instructions below, please replace `JewelryARApp` with an actual name of your application's App struct.

##### - Remove `@main` attribute from `App` struct

```diff
 import SwiftUI
 
-@main
 struct JewelryARApp: App {
```

##### - Create `main.swift` file (and call `App.main`)

```swift
import Foundation
import JewelryAR

InitArgs(CommandLine.argc, CommandLine.unsafeArgv)

JewelryARApp.main()
```

#### (c) If your app's `main` file is in Swift

Add lines

```swift
import JewelryAR

InitArgs(CommandLine.argc, CommandLine.unsafeArgv)
```

before the call to [[UIApplicationMain]](https://developer.apple.com/documentation/uikit/1622933-uiapplicationmain).

#### (d) If your app's `main` file is in Objective-C

```diff
 #import <UIKit/UIKit.h>

 #import "AppDelegate.h"
+#import "UnityUtils.h"

 int main(int argc, char * argv[]) {
   @autoreleasepool {
+    InitArgs(argc, argv);
     return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
   }
 }
```

---

## Adding Jewelry AR View to `UIViewController`

### 0. Import `JewelryAR` module

```swift
import JewelryAR
```

### 1. Add `JewelryARView` to your view hierarchy

```swift
let arView = JewelryARView(frame: view.bounds)

view.addSubview(arView)
view.addConstraints([
    view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: arView.topAnchor),
    view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: arView.bottomAnchor),
    view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: arView.leadingAnchor),
    view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: arView.trailingAnchor),
])
```

### 2. Assign the properties

```swift
arView.apiURL = "https://stage-api-ar.postindustria.com/v1"
arView.apiKey = "spWyH9aA-OEL-Bl27KHAeQ"
arView.modelID = "73"
```

---

## Adding Jewelry AR View to SwiftUI view

### 0. Import `JewelryAR_SwiftUI` module

```swift
import JewelryAR_SwiftUI
```

### 1. Add `JewelryARView` to your body

```swift
JewelryARView(apiURL: "https://stage-api-ar.postindustria.com/v1",
              apiKey: "spWyH9aA-OEL-Bl27KHAeQ",
              modelID: "73")
```

---

## Tracking AR Scene state in SwiftUI app

### 1. Declare state variable

```swift
@State var arSceneState: ARSceneState?
```

### 2. Pass a binding to this variable into `JewelryARView`

```swift
JewelryARView(apiURL: "https://stage-api-ar.postindustria.com/v1",
              apiKey: "spWyH9aA-OEL-Bl27KHAeQ",
              modelID: "73",
              arSceneState: $arSceneState)
```

### 3. React to changes in `arSceneState`

```swift
HStack {
    Spacer()
    Text("Displayed ring: \(arSceneState?.ringStates?.displayedRing?.model?.id ?? "nil")")
    Spacer()
}
```
