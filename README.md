# SwiftyPresenter

[![Version](https://img.shields.io/cocoapods/v/SwiftyPresenter.svg?style=flat)](http://cocoapods.org/pods/SwiftyPresenter)
[![License](https://img.shields.io/cocoapods/l/SwiftyPresenter.svg?style=flat)](http://cocoapods.org/pods/SwiftyPresenter)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyPresenter.svg?style=flat)](http://cocoapods.org/pods/SwiftyPresenter)

## Description

SwiftyPresenter is a very simple to use, custom View Controller Transitioning delegate. The class can only be instantiated, and can't be subclassed (as of right now). There are plans in the future to build a subclass of UIViewController, and implement the SwiftyPresenter functionality within it. 

## Configuration Options

The default configuration for the delegate is as follows:
 - Dimmer View: This is added behind the View Controller container. It "dims" the view behind the container, in case the user doesn't wan't the container to take up the whole screen.
     + Default: Enabled
 - Dismiss With Dimmer View: This enables/dismisses the touch gesture on the dimmer view to close out the Swifty Presenter.
 - Direction: Specifies the direction the view controller will transition from (top, right, bottom, left)
     + Default: Bottom
 - Container Size: This determines the size of the view controller container. It's a multiplier that's used on the views full size. As of v.0.1.1, this is functional, for top and bottom transitions. Left and right transitions currently usees the view's full height, with 2/3's of it's width. Will implement for Left and Right later on.
     + Default: w = 1, h = 1
 - Frame Position: Determines the frame for the container. This tells the container where to stop transitioning on the screen. This is a multiplier that used on the containers frame origin. For example, if you want your bottom transition to stop 10% of the way from the top of the screen, set the height value to 0.9.
 - Animation Duration: The time it takes for the container to transition to it's final state (seconds)
     + Default: 0.5
 - Animation Delay: Delay before container begins to transition (seconds)
     + Default: 0.0
 - Animation With Spring Dampening: Add Spring Dampening to animation. If at 1.0, there is no "bounce effect" on the container. The close you get to 0.0, the more "bounce" you will have.
     + Default: 1.0
 - Animation With Initial Spring Velocity: The initial velocity the view starts off at when it begins transitioning.
     + Default: 1.0
 - Round Corners: Rounds the corners of the container. Can choose: .topLeft, .topRight, .bottomLeft, and .bottomRight.
     + Defautl: nil
 - Corner Radius: If the corners are set to be rounded, this tells the container how much to curve the corners.
     + Default: 10.0
    
## Basic Example

To set the default configuration for the SwiftyPresenter, do the following:

```
lazy var swiftyTransition = SwiftyPresenter()
```

To customize the configuration, (3) different transition functions should be called. Below is an example of how to do that:

```
    lazy var swiftyTransition: SwiftyPresenter = {
        let swifty = SwiftyPresenter()
        swifty.transition(from: .bottom, useDimmer: true, dismissWithDimmer: false, withContainerSizeof: .containerSize(width: 1, height: 1), framePositionAt: .framePos(width: 1, height: 0.9))
        swifty.transition(withAnimationDurationOf: 0.8)
        swifty.transition(withRoundCornersOn: [.topLeft, .topRight])
        return swifty
    }()
```

## Installation

SwiftyPresenter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'SwiftyPresenter', '~> 0.1.2’
```

## Author

Atticus08, tfritz08@gmail.com

## License

SwiftyPresenter is available under the MIT license. See the LICENSE file for more info.
