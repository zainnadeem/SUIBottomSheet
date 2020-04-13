# SUIBottomSheet
![alt text](https://github.com/zainnadeem/SUIBottomSheet/blob/master/SwiftUI.png)
[![Version](https://img.shields.io/cocoapods/v/SUIBottomSheet.svg?style=flat)](https://cocoapods.org/pods/SUIBottomSheet)
[![License](https://img.shields.io/cocoapods/l/SUIBottomSheet.svg?style=flat)](https://cocoapods.org/pods/SUIBottomSheet)
[![Platform](https://img.shields.io/cocoapods/p/SUIBottomSheet.svg?style=flat)](https://cocoapods.org/pods/SUIBottomSheet)

# Getting Started

## Requirements

- iOS 13.0+
- Xcode 11
- Swift 5

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `SUIBottomSheet` by adding it to your `Podfile`:

```ruby
platform :ios, '13.0'
use_frameworks!
pod 'SUIBottomSheet'
```

## Implementation

BottomSheetView is initialized with a **BottomSheetOptions** class that populates the sheet with customizable information. Create an **@ObservedObject BottomSheetOptions** class to manage the BottomSheetView. You can initialize it with parameters or allow it to populate with default ones.

```swift
struct ContentView: View {

    @ObservedObject var options: BottomSheetOptions = BottomSheetOptions()
    
    var body: some View {
 
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
### Add ZStack
Add a ZStack to your body view so that the bottomSheet can be presented on top of whatever view you create. 
```swift
struct ContentView: View {

    @ObservedObject var options: BottomSheetOptions = BottomSheetOptions()
   
    var body: some View {
          ZStack {
   
        }
    }
```
### Implement Toggle
The options class holds the ability to toggle the bottom sheet. Let's add a simple button to display & hide the bottom sheet.
```swift
struct ContentView: View {

    @ObservedObject var options: BottomSheetOptions = BottomSheetOptions()
    var body: some View {
          ZStack {
            Button(action: {
                self.options.toggleSheet()
            }) {
                Text("Test BottomSheet")
            }
        }
    }
```
### Add BottomSheetView
Last, let's add our bottomSheet with our bottomSheetOption to the top of the ZStack.
```swift
struct ContentView: View {

    @ObservedObject var options: BottomSheetOptions = BottomSheetOptions()
    
    var body: some View {
          ZStack {
            Button(action: {
                self.options.toggleSheet()
            }) {
                Text("Test BottomSheet")
            }
            BottomSheetView(options: self._options)
        }
    }
```

## Initializing BottomSheetOptions with Parameters
You can cutomize your properties at any time and they will be updated on the bottomSheet immediately using SwiftUI's @ObservableObjects, @State, @Bindig features. Let's initialize the bottomSheetOptions with some custom parameters.

```swift
struct ContentView: View {

    @ObservedObject var options: BottomSheetOptions = BottomSheetOptions(indicatorColor: .blue, title: "Oscar Wilde", titleColor: .black, subtitle: "Intentions", subtitleColor: Color(UIColor.darkGray), bodyText: "Cyril (coming in through the open window from the terrace).  My dear Vivian...")
   
    var body: some View {
          ZStack {
            Button(action: {
                self.options.toggleSheet()
            }) {
                Text("Test BottomSheet")
            }
            BottomSheetView(options: self._options)
        }
    }
```
Customizable properties
- [x] indicatorColor: Color
- [x] title: String
- [x] titleColor: Color
- [x] subtitle: String
- [x] subtitleColor: Color
- [x] bodyText: String
- [x] bodyTextColor: Color
- [x] backgroundColor: Color
- [x] scrollViewColors: [Color]
- [x] dismissAccentColor: Color


## Observing State Changes
The options class contains an accessable parameter called sheetState. Check this parameter and update your view as needed. Let's add a function that updates the background of the host view everytime the state of the bottomsheet changes. 

```swift
struct ContentView: View {

    @ObservedObject var options: BottomSheetOptions = BottomSheetOptions(indicatorColor: .blue, title: "Oscar Wilde", titleColor: .black, subtitle: "Intentions", subtitleColor: Color(UIColor.darkGray), bodyText: "Cyril (coming in through the open window from the terrace).  My dear Vivian...")
    
    var body: some View {
          ZStack {
            Button(action: {
                self.options.toggleSheet()
            }) {
                Text("Test BottomSheet")
            }
            BottomSheetView(options: self._options)
        }
    }

      private func updateBackgroundColor()->Color{
        switch options.sheetState {
            case .dismissed:
            return .white
            case .collapsed:
            return .blue
            case .expanded:
            return .orange
        }
    }
    
```
## Updating the view after changes have been read
Make sure you set the color of the ZStack's background with updateBackgroundColor() like this: 
```swift
    var body: some View {
          ZStack {
            Button(action: {
                self.options.toggleSheet()
            }) {
                Text("Test BottomSheet")
            }
            BottomSheetView(options: self._options)
        
        }.background(updateBackgroundColor())
    }
    
```

## Author

Zain Nadeem, zn.nadeem@gmail.com

## License

SUIBottomSheet is available under the MIT license. See the LICENSE file for more info.
