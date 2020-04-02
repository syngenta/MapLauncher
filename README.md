# MapLauncher

[![Version](https://img.shields.io/cocoapods/v/MapLauncher.svg?style=flat)](https://cocoapods.org/pods/MapLauncher)
[![License](https://img.shields.io/cocoapods/l/MapLauncher.svg?style=flat)](https://cocoapods.org/pods/MapLauncher)
[![Platform](https://img.shields.io/cocoapods/p/MapLauncher.svg?style=flat)](https://cocoapods.org/pods/MapLauncher)

The library allows in the simplest way to add "Route to `any location`" functionality to your app. By calling the only one method the library attempt to present an ActionSheet with all supported and installed navigation app on the device.

For now, supporting: Apple Maps, Google Maps, Waze and Yandex.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

MapLauncher is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MapLauncher'
```

## Usage 

`import MapLauncher`

...
```
// Desired destination coordinates
let placeLocation = CLLocationCoordinate2D(latitude: 50.4536, longitude: 30.5164)

// Presenting navigation apps ActionSheet
MapLauncher().present(destination: placeLocation, on: self)
```


## Author

Dmitriy Romanov, dimkahr@gmail.com

## License

MapLauncher is available under the MIT license. See the LICENSE file for more info.
