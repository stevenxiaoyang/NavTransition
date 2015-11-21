//
//  popAnimation.m
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import "popAnimation.h"
static const CGFloat kDefaultDuration = 2.f;  //默认动画时间
@implementation popAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return kDefaultDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [[transitionContext containerView]addSubview:toView];
    [[transitionContext containerView]bringSubviewToFront:fromView];
    toView.transform = self.bigTransform;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = self.smallTransform;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
