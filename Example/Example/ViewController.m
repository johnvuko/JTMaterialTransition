//
//  ViewController.m
//  Example
//
//  Created by Jonathan Tribouharet
//

#import "ViewController.h"

#import <JTMaterialTransition.h>

#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic) JTMaterialTransition *transition;
@property (nonatomic) UIButton *presentControllerButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createPresentControllerButton];
    [self createTransition];
}

- (void)createPresentControllerButton
{
    CGFloat y = 300;
    CGFloat width = 50;
    CGFloat height = width;
    CGFloat x = (CGRectGetWidth(self.view.frame) - width) / 2.;
    
    self.presentControllerButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    self.presentControllerButton.layer.cornerRadius = width / 2.;
    self.presentControllerButton.backgroundColor = [UIColor colorWithRed:86./256. green:188./256. blue:138./256. alpha:1.];
    
    [self.presentControllerButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    
    [self.presentControllerButton addTarget:self action:@selector(didPresentControllerButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.presentControllerButton];
}

- (void)didPresentControllerButtonTouch
{
    UIViewController *controller = [SecondViewController new];
    
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.transitioningDelegate = self;

    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - Transition

- (void)createTransition
{
    self.transition = [[JTMaterialTransition alloc] initWithAnimatedView:self.presentControllerButton];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.reverse = NO;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.reverse = YES;
    return self.transition;
}

@end
