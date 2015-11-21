//
//  pushAnimation.m
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import "pushAnimation.h"
static const CGFloat kDefaultDuration = 2.f;  //默认动画时间
@implementation pushAnimation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return kDefaultDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [[transitionContext containerView]addSubview:toView];
    toView.hidden = YES;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = self.bigTransform;
    } completion:^(BOOL finished) {
        toView.hidden = NO;
        fromView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
