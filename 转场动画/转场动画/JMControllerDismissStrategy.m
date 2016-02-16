//
//  JMControllerDismissStrategy.m
//  转场动画
//
//  Created by joker on 16/2/16.
//  Copyright © 2016年 TomorJM. All rights reserved.
//

#import "JMControllerDismissStrategy.h"

@implementation JMControllerDismissStrategy
// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (fromView.transform.b > 0 )//向右掉下去
        {
            fromView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else //向左掉下去
        {
            fromView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
@end
