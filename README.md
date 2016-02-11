# RippleAnimation
Google Material Design Ripple Effects for Swift project. This project is inspired from Android Material Design Ripple Effects.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Features
<img src="https://raw.github.com/wiki/mnat44/RippleAnimation/images/ripple-animation-sample.gif" width="207" height="368">

- Easy way to use Ripple Effects.
- Call `rippleAnimate` to your `UIView` instances.
- `rippleAnimate` is `UIView` extension.


## Usage

First, you should import `RippleAnimation` module.

```
import RippleAnimation
```

And now, you can call `rippleAnimate`.

```
@IBAction func pressed(sender: UIButton) {
    sender.rippleAnimate(color: UIColor.redColor()) { print("ripple!!") }
}
```

You can use `rippleAnimate` with more detail parameters just like below.

```
self.contentView.rippleAnimate(color: rippleColor, scale: 10, startRect: startRect, scaleAnimateDuration: 1.0, fadeAnimateDuration: 0.5) { () -> Void in
    print("ripple!!")
}
```

More details is written in Demo project.


## Runtime Requirements

- iOS8.4 or later
- Xcode 7.0 - Swift2.0

### Installation

#### CocoaPods

To install RippleAnimation with CocoaPods, add the following lines in your Podfile and run `pod install`.

```
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!
pod ‘RippleAnimation’, ‘0.1.1’
```

#### Carthage
To Install RippleAnimation with Carthage, write `github "mnat44/RippleAnimation"` in your Cartfile and run `carthage update`.

## License
RippleAnimation is released under the MIT license. Go read the LICENSE file for more information.
