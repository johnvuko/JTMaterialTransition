# JTMaterialTransition

[![CI Status](http://img.shields.io/travis/jonathantribouharet/JTMaterialTransition.svg)](https://travis-ci.org/jonathantribouharet/JTMaterialTransition)
![Version](https://img.shields.io/cocoapods/v/JTMaterialTransition.svg)
![License](https://img.shields.io/cocoapods/l/JTMaterialTransition.svg)
![Platform](https://img.shields.io/cocoapods/p/JTMaterialTransition.svg)

An iOS transition for controllers based on material design.

## Installation

With [CocoaPods](http://cocoapods.org/), add this line to your Podfile.

    pod 'JTMaterialTransition', '~> 1.0'

## Screenshots

![Example](./Screens/example.gif "Example View")

## Usage

### Basic usage

```objective-c
#import <UIKit/UIKit.h>

// You have to implement UIViewControllerTransitioningDelegate protocol
@interface ViewController : UIViewController<UIViewControllerTransitioningDelegate>
@end

```

```objective-c
#import "ViewController.h"

#import <JTMaterialTransition.h>
#import "SecondViewController.h"

@implementation ViewController

@interface ViewController ()

@property (nonatomic) JTMaterialTransition *transition;
@property (nonatomic) UIButton *presentControllerButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // No specific moment to call this method, just before presenting a controller
    [self createTransition];
}

- (void)didPresentControllerButtonTouch
{
    // The controller you want to present
    UIViewController *controller = [SecondViewController new];
    
    // Indicate you use a custom transition
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.transitioningDelegate = self;

    [self presentViewController:controller animated:YES completion:nil];
}

// Initialize the tansition
- (void)createTransition
{
    // self.presentControllerButton is the animatedView used for the transition
    self.transition = [[JTMaterialTransition alloc] initWithAnimatedView:self.presentControllerButton];
}

// Indicate which transition to use when you this controller present a controller
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.reverse = NO;
    return self.transition;
}

// Indicate which transition to use when the presented controller is dismissed
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.reverse = YES;
    return self.transition;
}
@end
```

## Notes

The `animatedView` is not directly used, a new view is created based on the `frame`, `backgroundColor` properties for the animation.
If you don't want to provide a view, you have to set `startFrame` and `startBackgroundColor` properties and call `init` instead of `initWithAnimatedView:`.

`startFrame` must be the coordinates relative to the window:

    CGRect startFrame = [_animatedView.superview convertRect:_animatedView.frame toView:nil];

## Warning

The controller presented must have a `backgroundColor` else the effect can be a little strange. If you use a `UINavigationController` or another container don't forget to set the `backgroundColor` with `controllerPresented.view.backgroundColor = [UIColor yourColor];`.

## Requirements

- iOS 7 or higher
- Automatic Reference Counting (ARC)

## Author

- [Jonathan Tribouharet](https://github.com/jonathantribouharet) ([@johntribouharet](https://twitter.com/johntribouharet))

## License

JTMaterialTransition is released under the MIT license. See the LICENSE file for more info.
