# MapLauncher

The library allows in the simplest way to add "Route to `any location`" functionality to your app. By calling the only one method the library attempt to present an ActionSheet with all supported and installed navigation app on the device.

For now, supporting: **Apple Maps**, **Google Maps**, **Waze** and **Yandex**.

<img src='/MAPLExample/MAPLExample.jpg' width='400'>

## Example

To play with usage example navigate to MAPLExample folder and look at MAPLExample.xcodeproj 

## Installation

### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/syngenta/MapLauncher.git`

### CocoaPods **(Depricated, latest avalible version 0.1.1)**

MapLauncher is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MapLauncher'
```


## Usage 

Add to your project `Info.plist` next key-value pair:

```xml
...
<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>waze</string>
		<string>comgooglemaps</string>
		<string>yandexnavi</string>
	</array>
...
```

In a place where you are going to implement the functionality you need to import the library:

```swift
import MapLauncher
```


And call ActionSheet next way:

```swift
...
// Desired destination coordinates
let placeLocation = CLLocationCoordinate2D(latitude: 50.4536, longitude: 30.5164)

// Presenting navigation apps ActionSheet
MapLauncher().present(destination: placeLocation, on: self)

// or 

MapLauncher().present(
	destination: placeLocation, 
	on: self,
    actionSheetTitle: "Build a route using:",
    actionSheetMessage: "(you will be redirected to the selected app)"
)
...
```


## Author

Dmytro Romanov, dimkahr@gmail.com

## License

MapLauncher is available under the MIT license. See the LICENSE file for more info.
