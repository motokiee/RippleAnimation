# RippleAnimation
Google Material Design Ripple Effects for Swift project. This project is inspired from Android Material Design Ripple Effects.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Features
<img src="https://raw.github.com/wiki/mnat44/RippleAnimation/images/ripple-animation-sample.gif" width="207" height="368">

- Easy way to use Ripple Effects.
- Call `rippleAnimate` to your `UIView` instances with RippleConfiguration.
- `rippleAnimate` is `UIView` extension.


## Usage

First, you should import `RippleAnimation` module.

```swift
import RippleAnimation
```

And now, you can call `rippleAnimate` with `UIView.RippleConfiguration` instance.

```swift
@IBAction func pressed(sender: UIButton) {
    let config = UIView.RippleConfiguration(color: UIColor.alizarin())
    sender.rippleAnimate(with: config, completionHandler: {
        print("ripple!!")
    })
}
```

You can use `rippleAnimate` with more detail parameters with `RippleConfiguration` just like below.

```swift
@IBAction func pressed(sender: UIButton) {
    var config = UIView.RippleConfiguration(color: UIColor.alizarin())
    config.clipsToBounds = true
    config.scaleAnimateDuration = 0.3
    config.fadeAnimateDuration = 0.1
    sender.rippleAnimate(with: config, completionHandler: {
        print("ripple!!")
    })
}
```

More details is written in Demo project.


## Runtime Requirements

- iOS9.3 or later
- Xcode8 - Swift3

### Installation

#### CocoaPods

To install RippleAnimation with CocoaPods, add the following lines in your Podfile and run `pod install`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!
pod ‘RippleAnimation’, ‘0.3’
```

#### Carthage
To Install RippleAnimation with Carthage, write `github "mnat44/RippleAnimation"` in your Cartfile and run `carthage update`.

## License
RippleAnimation is released under the MIT license. Go read the LICENSE file for more information.
