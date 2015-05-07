//
//  JTMaterialTransition.m
//  JTMaterialTransition
//
//  Created by Jonathan Tribouharet
//

#import "JTMaterialTransition.h"

@implementation JTMaterialTransition

- (instancetype)initWithAnimatedView:(UIView *)animatedView
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    NSAssert(animatedView != nil, @"animatedView cannot be nil");
    _animatedView = animatedView;

    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if(_animatedView){
        self.startFrame = _animatedView.frame;
        self.startBackgroundColor = _animatedView.backgroundColor;
    }
        
    UIView *animatedViewForTransition;
    
    {
        animatedViewForTransition = [[UIView alloc] initWithFrame:self.startFrame];
        [transitionContext.containerView addSubview:animatedViewForTransition];

        animatedViewForTransition.clipsToBounds = YES;
        animatedViewForTransition.layer.cornerRadius = CGRectGetHeight(animatedViewForTransition.frame) / 2.;
        animatedViewForTransition.backgroundColor = self.startBackgroundColor;
    }
    
    CGAffineTransform finalTransform;
    {
        CGFloat size = MAX(CGRectGetHeight(transitionContext.containerView.frame), CGRectGetWidth(transitionContext.containerView.frame)) * 1.2;
        CGFloat scaleFactor = size / CGRectGetWidth(animatedViewForTransition.frame);
        finalTransform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    }
    
    UIViewController *presentedController;
    if(!self.isReverse){
        presentedController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        
        presentedController.view.frame = transitionContext.containerView.bounds;
        presentedController.view.layer.opacity = 0;
        [transitionContext.containerView addSubview:presentedController.view];
    }
    else{
        presentedController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        
        presentedController.view.frame = transitionContext.containerView.bounds;
        [transitionContext.containerView addSubview:presentedController.view];
    }
 
    if(!self.isReverse){
        [UIView transitionWithView:animatedViewForTransition
                          duration:[self transitionDuration:transitionContext] * .7
                           options:0
                        animations:^{
                            animatedViewForTransition.transform = finalTransform;
                            animatedViewForTransition.center = transitionContext.containerView.center;
                            animatedViewForTransition.backgroundColor = presentedController.view.backgroundColor;
                        } completion:nil];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] * .42
                              delay:[self transitionDuration:transitionContext] * .58
                            options:0
                         animations:^{
                             presentedController.view.layer.opacity = 1;
                         } completion:^(BOOL finished) {
                             [animatedViewForTransition removeFromSuperview];
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
    }
    else{
        animatedViewForTransition.transform = finalTransform;
        animatedViewForTransition.center = transitionContext.containerView.center;
        animatedViewForTransition.backgroundColor = presentedController.view.backgroundColor;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] * .7
                         animations:^{
                             presentedController.view.layer.opacity = 0;
                         } completion:nil];
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * [self transitionDuration:transitionContext] * .32), dispatch_get_main_queue(), ^{
            [UIView transitionWithView:animatedViewForTransition
                              duration:[self transitionDuration:transitionContext] * .58
                               options:0
                            animations:^{
                                animatedViewForTransition.transform = CGAffineTransformIdentity;
                                animatedViewForTransition.backgroundColor = self.startBackgroundColor;
                                animatedViewForTransition.frame = self.startFrame;
                            } completion:^(BOOL finished) {
                                [animatedViewForTransition removeFromSuperview];
                                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                            }];
        });
    }
}

@end
