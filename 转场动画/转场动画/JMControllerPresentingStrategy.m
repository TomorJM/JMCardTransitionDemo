//
//  JMControllerPresentingStrategy.m
//  转场动画
//
//  Created by joker on 16/2/6.
//  Copyright © 2016年 TomorJM. All rights reserved.
//

#import "JMControllerPresentingStrategy.h"

@implementation JMControllerPresentingStrategy


// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    NSLog(@"animateTransition");
    //1.containerView
    UIView *container = [transitionContext containerView];
    
    //2 toView
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [container addSubview:toView];
    //动画开始前,先让toView逆时针旋转九十度
    toView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        //toView回到正常位置
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
