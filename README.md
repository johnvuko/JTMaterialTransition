# JTMaterialTransition

[![CI Status](http://img.shields.io/travis/jonathantribouharet/JTMaterialTransition.svg)](https://travis-ci.org/jonathantribouharet/JTMaterialTransition)
![Version](https://img.shields.io/cocoapods/v/JTMaterialTransition.svg)
![License](https://img.shields.io/cocoapods/l/JTMaterialTransition.svg)
![Platform](https://img.shields.io/cocoapods/p/JTMaterialTransition.svg)

An iOS transition for controllers based on material design.

## Installation

With [CocoaPods](http://cocoapods.org/), add this line to your Podfile.

    pod 'JTMaterialTransition', '~> 2.0'

## Screenshots

![Example](./Screens/example.gif "Example View")

## Usage

### Basic usage

```swift
import UIKit
import JTMaterialTransition

class ViewController: UIViewController {

    weak var presentControllerButton: UIButton?
    var transition: JTMaterialTransition?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transition = JTMaterialTransition(animatedView: self.presentControllerButton)
    }
    
    func didPresentControllerButtonTouch () {
        let controller = SecondViewController()
        
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self.transition
        
        self.present(controller, animated: true, completion: nil)
    }

}
```

## Notes

The `animatedView` is not directly used, a new view is created based on the `frame`, `backgroundColor` properties for the animation.
If you don't want to provide a view, you have to set `startFrame` and `startBackgroundColor` properties and call `init` instead of `initWithAnimatedView:`.

`startFrame` must be the coordinates relative to the window:

    var startFrame = animatedView.superview?.convert(animatedView.frame, to: nil)

## Warning

The controller presented must have a `backgroundColor` else the effect can be a little strange. If you use a `UINavigationController` or another container don't forget to set the `backgroundColor` with `controllerPresented.view.backgroundColor = UIColor.yourColor`.

## Requirements

- iOS 8.0 or higher
- Swift 3.0

## Author

- [Jonathan Tribouharet](https://github.com/jonathantribouharet) ([@johntribouharet](https://twitter.com/johntribouharet))

## License

JTMaterialTransition is released under the MIT license. See the LICENSE file for more info.
