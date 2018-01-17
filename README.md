# C2Alert

[![CI Status](http://img.shields.io/travis/Berk-Kaya/C2Alert.svg?style=flat)](https://travis-ci.org/Berk-Kaya/C2Alert)
[![Version](https://img.shields.io/cocoapods/v/C2Alert.svg?style=flat)](http://cocoapods.org/pods/C2Alert)
[![License](https://img.shields.io/cocoapods/l/C2Alert.svg?style=flat)](http://cocoapods.org/pods/C2Alert)
[![Platform](https://img.shields.io/cocoapods/p/C2Alert.svg?style=flat)](http://cocoapods.org/pods/C2Alert)

## About

C2Alert is a simple alert library with good and customizable design.

#### With Icon
<img src="https://cdn.pbrd.co/images/H3jkuoO.gif" width="250"><img src="https://cdn.pbrd.co/images/H3jkk8H.gif" width="250">

#### No Icon
<img src="https://cdn.pbrd.co/images/H3jjN6h.gif" width="250"><img src="https://cdn.pbrd.co/images/H3jkL7X.gif" width="250">


## Requirements

## Installation

C2Alert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'C2Alert'
```

## Supported Swift Versions

| C2Alert Version   |      Swift Version      |    Min. iOS Version      |
|----------|:-------------:|:-------------:|
| => 0.1.0  |  Swift 3  | >= iOS 9.0  |

## Getting started

Create a C2Alert object with suitable initializer, then call the show function

### Usage

#### Basic

```swift

let alert = C2Alert(title: "Success", message: "You're doing great!", image: UIImage(named: "success_icon")!)
alert.show()

```
#### Available modifiers

```swift

let alert = C2Alert(title: "Success", message: "You're doing great!", image: UIImage(named: "success_icon")!)
alert.autoHideAfterSeconds = 5
alert.dialogBackgroundColor = .gray
alert.dialogImageColor = .black
alert.dialogMessageTextColor = .black
alert.dialogTitleTextColor = .black
alert.duration = 0.6 // This is show and hide animate duration
alert.hideOnBackgroundTouch = false // default true
alert.imageSize = CGSize(width: 100, height: 100)
alert.messageFont = UIFont(name: "Avenir-Roman", size: 15)!
alert.titleFont = UIFont(name: "Avenir-Heavy", size: 18)!
alert.overlay = true // default true
alert.overlayColor = .black // default black
alert.overlayOpacity = 0.3 // default 0.6
alert.paddingFromSides = 30 // default 32
alert.seperatorHeight = 8 // Space between title, message and image
alert.paddingTopAndBottom = 22 // default 24
alert.show()

```

## Requirements

* iOS 9.0+
* Xcode 8.0+
* Swift 3.0+

## Author
[Connected2.me](http://connected2.me) / <a href="mailto:berkkaya88@gmail.com">Berk Kaya</a>

## License

C2Alert is available under the MIT license. See the LICENSE file for more info.
