# SimulatorPermissions

[![CI Build](https://github.com/MathewYaldo/SimulatorPermissions/workflows/CI%20Build/badge.svg)](https://github.com/MathewYaldo/SimulatorPermissions/)
[![CI Status](https://img.shields.io/travis/MathewYaldo/SimulatorPermissions.svg?style=flat)](https://travis-ci.org/MathewYaldo/SimulatorPermissions)
[![Version](https://img.shields.io/cocoapods/v/SimulatorPermissions.svg?style=flat)](https://cocoapods.org/pods/SimulatorPermissions)
[![License](https://img.shields.io/cocoapods/l/SimulatorPermissions.svg?style=flat)](https://cocoapods.org/pods/SimulatorPermissions)
[![Platform](https://img.shields.io/cocoapods/p/SimulatorPermissions.svg?style=flat)](https://cocoapods.org/pods/SimulatorPermissions)

## SimulatorPermissions

SimulatorPermissions is a library that allows you to easily grant permissions on a simulator for unit testing purposes. 

For example, you may have an app that deals with contacts and you need to get that permission. You could manually get the permission within the simulator and then run your unit tests, but this wouldn't work testing in a CI/CD environment. With this library, you can set the necessary permissions allowing you test on a simulator without ever having to manually hit Allow on a prompt requesting for permission.

This library is intended to be the successor to [JPSimulatorHacks](https://github.com/plu/JPSimulatorHacks). 

## Requirements

## Installation

SimulatorPermissions is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimulatorPermissions'
```

## Author

Mathew Yaldo, mathewyaldo@oakland.edu

## License

SimulatorPermissions is available under the MIT license. See the LICENSE file for more info.
