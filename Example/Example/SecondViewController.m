//
//  SecondViewController.m
//  Example
//
//  Created by Jonathan Tribouharet
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:54./256. green:70./256. blue:93./256. alpha:1.];
    
    [self createCloseButton];
}

- (void)createCloseButton
{
    CGFloat y = 300;
    CGFloat width = 50;
    CGFloat height = width;
    CGFloat x = (320 - width) / 2.;
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
    [closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    
    [closeButton addTarget:self action:@selector(didCloseButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:closeButton];
}

- (void)didCloseButtonTouch
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
