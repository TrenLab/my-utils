# MYUtils.
[![Version](https://img.shields.io/github/release/damonthecricket/my-utils.svg)](https://github.com/damonthecricket/my-utils/releases)
[![Travis CI](https://travis-ci.org/damonthecricket/my-utils.svg?branch=master)](https://travis-ci.org/damonthecricket/my-utils)
![CocoaPods](https://img.shields.io/cocoapods/v/MYUtils.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/damonthecricket/my-utils/master/LICENSE)
![Platform](https://img.shields.io/badge/platforms-iOS%208.0+%20%7C%20macOS%2010.10+%20%7C%20tvOS%209.0+%20%7C%20watchOS%202.0+-333333.svg)

![MYJSON](https://github.com/damonthecricket/my-utils/blob/master/my-utils-lib.jpg)

MYUtils is a simple Swift library, that extends Cocoa frameworks.

1. [Features](#features)
2. [Installation](#installation)
3. [Requirements](#requirements)
4. [Usage](#usage)

### Features.

1. [UI](#ui)
   - [Classes](#ui_classes)
      - [Storyboard Segues](#ui_storyboard_segues_classes)
   - [Extensions](#ui_extensions)
      - [CoreGraphics](#ui_core_graphics_extensions)
      - [Image](#ui_image_extensions)
      - [View](#ui_view_extensions)
      - [ViewController](#ui_view_cotroller_extensions)
2. [Foundation](#foundation)
   - [Classes](#foundation_classes)
      - [Cache](#foundation_cache_classes)
      - [Result](#foundation_result_classes)
   - [Extensions](#foundation_extensions)
      - [Array](#foundation_array_extensions)
      - [Dictionary](#foundation_dictionary_extensions)
      - [Double](#foundation_double_extensions)
      - [Float](#foundation_float_extensions)
      - [Int](#foundation_int_extensions)
      - [NotificationCenter](#foundation_notification_center_extensions)
      - [NSNumber](#foundation_nsnumber_extensions)
      - [OperationQueue](#foundation_operation_queue_extensions)
      - [String](#foundation_string_extensions)
      - [Timer](#foundation_timer_extensions)
      - [UserDefaults](#foundation_user_defaults_extensions)

### Installation.
- #### [CocoaPods](http://cocoapods.org/)

  ```ruby
  use_frameworks!
  
  pod 'MYUtils'
  ```

- #### [Carthage](https://github.com/Carthage/Carthage)

  ```
  github "damonthecricket/my-utils"
  ```

- #### [Git](https://git-scm.com/)

  ```
  $ git submodule add https://github.com/damonthecricket/my-utils.git
  ```
- #### Manually

  - Copy MYUtils to the root of your project.
  
  - Add it in file inspector of your project.
  
  - Go to Targets -> Add MYUtils to Embedded Binaries.

### Requirements.

 - iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.
 
 - Xcode 8.3
 
 - Swift 3.

### Usage.
