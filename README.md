# MYUtils.
[![Version](https://img.shields.io/github/release/damonthecricket/my-utils.svg)](https://github.com/damonthecricket/my-utils/releases)
[![Travis CI](https://travis-ci.org/damonthecricket/my-utils.svg?branch=master)](https://travis-ci.org/damonthecricket/my-utils)
![CocoaPods](https://img.shields.io/cocoapods/v/MYUtils.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/damonthecricket/my-utils/master/LICENSE)
![Platform](https://img.shields.io/badge/platforms-iOS%208.0+%20%7C%20macOS%2010.10+%20%7C%20tvOS%209.0+%20%7C%20watchOS%202.0+-333333.svg)

![MYJSON](https://github.com/damonthecricket/my-utils/blob/README/my-utils-lib.jpg)

MYUtils is a simple Swift library, that extends Cocoa frameworks.

1. [Features](#features)
2. [Installation](#installation)
3. [Requirements](#requirements)
4. [Usage](#usage)

### Features.

1. [UI](#ui)
   - [Classes](#ui_classes)
      - [Storyboard Segues](###ui_storyboard_segues_classes)
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

#### UI:
##### - Classes:
  - ```DismissStoryboardSegue``` is intended to dismiss ViewController using Storyboard, not programmatically. All we need 
    is control-click an appropriate element in the first ViewController and drag to the target ViewController (or to itself)   
    that was presented via ``` func present(UIViewController, animated: Bool, completion: (() -> Void)? = nil) ``` method.    
    Then make storyboard segue kind custom and assign ```DismissStoryboardSegue``` to its class in appropriate text field.
    Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
   
  - ```ShowStoryboardSegue``` is intended to add ViewController as a child ViewController using Storyboard. All we need is
    control-click an appropriate element in the first ViewController and drag to the target ViewController. Then make 
    storyboard segue kind custom and assign ```ShowStoryboardSegue``` to its class in appropriate text field.
    Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
   
  - ```HideStoryboardSegue``` is intended to remove ViewController from its parent ViewController using Storyboard. All we 
    need is control-click an appropriate element in the first ViewController and drag to the target ViewController. Then   
    make  storyboard segue kind custom and assign ```HideStoryboardSegue``` to its class in appropriate text field.
    Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
   
   - ```PopStoryboardSegue``` is intended to pop ViewController from its UINavigationController stack using Storyboard.
   All we need is control-click an appropriate element in the source ViewController and drag to itsel. Then make storyboard
   segue kind custom and assign ```PopStoryboardSegue``` to its class in appropriate text field.
      Available in iOS 8.0+  |  tvOS 9.0+.
      
##### - Extensions:
   ```CGRect``` extensions provides easy way to perform arithmetic operations on the ```CGRect, CGPoint, CGSize``` 
   structures.
   ```swift
   let firstRect  = CGRect(x: 10.0, y: 0.0, width: 100.0, height: 100.0)
   let secondRect = CGRect(x: 10.0, y: 100.0, width: 200.0, height: 10.0)
      
   let sumResultRect = firstRect + secondRect
   let minusResultRect = firstRect - secondRect
   let multiplicationResultRect = firstRect * secondRect
   let divisionResultRect = firstRect / secodeRect
      
   // sumResultRect will be equal to x: 20.0 y: 100.0 width: 300.0 height: 110.0 rect.
   // minusResultRect will be equal to x: 0.0 y: -100.0 width: -100.0 height: 90.0 rect.
   // multiplicationResultRect will be equal to x: 100.0 y: 0.0 width: 20 000.0 height: 1 000.0 rect.
   // divisionResultRect will be equal to x: 1.0 y: 0.0 width: 0.5 height: 10.0 rect.
   ```
   Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.

   ```CGFloat``` extensions includes opportunities to generate random numbers.
   ```swift
   let randomNumberInRange = CGFloat.random(min: 0.0, max: 10.0)
   let random = CGFloat.random
   let randomSign = CGFloat.randomSign
      
   // randomNumberInRange will be equal to number in range between 0.0 and 10.0 inclusive.
   // random will be equal to number in range between 0.0 and 1.0 inclusive.
   // randomSign will be equal to number 1.0 or -1.0.
   ```
   Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.
   
   ```Image``` extensions provides next opportunites:
   - Identify image orientation:
   ```swift
   let image = <image initialization...>
   switch image.orientation {
      case .portret:
      // When image has portret orientation.
      case .album:
      // When image has album orientation.            
      case .square:
      // When image has square form.                        
   }
      
   // Or use follow.
   if image.isPortret {
      // When image has portret orientation.
   } else if image.isAlbum {
      // When image has album orientation.         
   } else if image.isSquare {
      // When image has square form.                        
   }   
   ```
   Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.

  - Load image from rest resource:
  ```swift
  let url = <URL initialization...>
  MYImage.from(URL: ) {image in
     // In case of success this method loads / returns cached and provides in closure an image.
     // Oterwise, an image equals to `nil`.
  }
  ```
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.

  - Draw image:
  ```swift
  let size = <CGSize initialization...>
  let image = MYImageDraw(size: size) {ctx in
      ctx.setFillColor(color.cgColor)
  }
  ```
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.
     
  - Image cache:
  ```MYImage.cache``` is used by ```MYImage.imageFrom(URL url: URL, completion: MYImageDownloadCompletion? = nil)``` and
  ```MYImageView.imageFrom(URL url: URL, completion: MYImageDownloadCompletion? = nil)``` methods to cache downloaded
  images.
     Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.

  ```ImageView``` extensions provides next opportunites:
   
  ```swift
  let url = <URL initialization...>
  let imageView = <UIImage initialization...>
  imageView.imageFrom(URL: url) {image in
     // In case of success this method loads / returns cached, sets to reciever and provides in closure an image.
     // Oterwise, image equals to `nil`.
  }
  ```   
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.
   
  ```CollectionView``` extensions provides next opportunity:
  - Adjusting of number of rows in per row:
  ```swift
  let collectionView = <CollectionView initialization...>
  collectionView.numberOfCellsPerRow = 3
  // Now collectionView will layout three collection view cells in each row.
  ```
  Available in iOS 8.0+  |  macOS 10.11+  |  tvOS 9.0+.
   
  ```ScrollView``` extensions provodes next opportunites:
  - Identify current scroll content position:
  ```swift
  let scrollView = <ScrollView initialization...>
  switch scrollView.position {
  case .top:
     // When scroll content position on top.
  case .right:
     // When scroll content position on right.
  case .bottom:
     // When scroll content position on bottom.
  case .left:
     // When scroll content position on left.
  case .center:
     // When scroll content position on center.  
  }
  
  // Or you can use next methods.
  if scrollView.onTop {
     // When scroll content position on center.        
  } else if scrollView.onRight {
     // When scroll content position on right.   
  } else if scrollView.onBottom {
     // When scroll content position on bottom.  
  } else if scrollView.onLeft {
     // When scroll content position on left.
  } else if scrollView.onCenter {
     // When scroll content position on center.
  }
  ```  
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+  |  watchOS 2.0+.
  
  - Get content offset for macOS 10.11+:
  ```swift
  let scrollView = <ScrollView initialization...>
  let contentOffset =  scrollView.contentOffset
  ```
  Available in macOS 10.11+.

  - Identify current scroll direction:
  ```swift
  let scrollView = <ScrollView initialization...>
  switch scrollView.direction {
  case .vertical:
      // When scroll direction is vertical.
  case .horizontal:
      // When scroll direction is horizontal.
  }
  
  // Or you can use next methods.
  if scrollView.isVertical {
      // When scroll direction is vertical.
  } else if scrollView.isHorizontal {
      // When scroll direction is horizontal.      
  }
  ```  
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
  
  - Get actual scroll view content size:
  ```swift
  let scrollView = <ScrollView initialization...>
  let contentSize = scrollView.contentSize
  ```
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
  
  ```UIActivityViewController``` extensions provides next opportunities:
  - Easy way to initialize ```UIActivityViewController```:
  ```swift
  let string = <String initialization...> 
  let url = <URL initialization...>
  
  let activityViewController = UIActivityViewController(activityItems: [string, url], applicationActivities: nil) {        
         activityType, completed, returnedItems, activityError in
    // Completion code.
  }
  ```
  Available in iOS 8.0+.
  
  ```UIAlertController``` extensions provides next opportunities:
  - Easy way to present ```UIAlertController```:
  ```swift
  let title = <String initialization...>
  let message = <String initialization...>
  let actions = <UIAlertAction array initialization...>
  let style = <UIAlertControllerStyle initialization...>
  let vc = <UIViewController initialization...>
  
  UIAlertShow(title, message, actions, style, vc)
  
  // In code above, vc presents UIAlertController with specified attributes.
  ```
  Available in iOS 8.0+.

  - Easy way to make ```UIAlertAction```:
  ```swift
  let action = UIAlertActionMake(title: "Ok", .default) {action in
      // Completion code.
  }
  
  let cancelAction = UIAlertActionMakeCancel(title: "Cancel", .cancel) {action in
      // Completion code.
  }
  
  let defaultAction = UIAlertActionMake(title: "Done") {action in
      // Completion code.
  }
  ```
  Available in iOS 8.0+  |  tvOS 9.0+.
    
  ```UINavigationController``` extensions provides next opportunities: [#ui_view_cotroller_extensions]
  - Get root view controller:
  ```swift
  let navigatioController = <UINavigationController initialization...>
  
  let rootViewController = navigationController.rootViewController
  ```
  Available in iOS 8.0+  |  tvOS 9.0+.

  ```ViewController``` extensions provides next opportunities:
  - Get current child view controller:
  ```swift
  let viewController = <ViewController initialization...>
  
  let currentChildViewController = viewController.currentViewController
  ```
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
  
  - Get previous child view controller:
  ```swift
  let viewController = <ViewController initialization...>
  
  let currentChildViewController = viewController.previousViewController
  ```
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
  
  - Add view controller:
  ```swift
  let parentViewController = <ViewController initialization...>
  let childViewController = <ViewController initialization...>
  
  parentViewController.addChild(viewController: childViewController) {
      parentViewController.view.frame = CGRect(x: 0.0, y: 10.0, width: 100.0, height: 200.0)
  }
  ```
  Available in iOS 8.0+  |  macOS 10.10+  |  tvOS 9.0+.
  
  - Remove all child view controllers:
  ```swift
  let parentViewCotroller = <ViewController initialization...>
  
  let parentViewCotroller.removeChildViewControllers()
  ```
  
  - Remove child view controller:
  ```swift
  let parentViewController = <ViewController initialization...>
  let childViewController = <ViewController initialization...>
  
  parentViewController.removeChild(viewController: childViewController) {  
  }
   
  // Or.
  
  childViewController.removeFromSuperViewController()
  ```

  


  
  
  
  
  

  
  
  
  
  
  

  
  
  

  
   

   
   
   
   
