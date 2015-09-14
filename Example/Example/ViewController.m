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

@property (nonatomic, strong) UISwitch *switchControl;

@property (nonatomic, assign) NSInteger viewWillAppearCount;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.viewWillAppearCount ++;
    [[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"viewWillAppear called count : %ld", (long)self.viewWillAppearCount] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createPresentControllerButton];
    [self createTransition];
    [self createSwitchControl];
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

- (void)createSwitchControl {
    self.switchControl = [[UISwitch alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.presentControllerButton.frame) + 100, 80, 44)];
    CGPoint center = self.switchControl.center;
    center.x = CGRectGetMidX(self.view.bounds);
    self.switchControl.center = center;
    self.switchControl.on = NO;
    [self.view addSubview:self.switchControl];
}

- (void)didPresentControllerButtonTouch
{
    UIViewController *controller = [SecondViewController new];
    
    // If use UIViewControllerTransitioningDelegate, the viewWillAppear just call one
    
    // If don't use JTMaterialTransition, the viewWillAppear called at initlizer and close secondViewController page
    
    if (self.switchControl.on) {
        controller.modalPresentationStyle = UIModalPresentationCustom;
        controller.transitioningDelegate = self;
    }
    
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
