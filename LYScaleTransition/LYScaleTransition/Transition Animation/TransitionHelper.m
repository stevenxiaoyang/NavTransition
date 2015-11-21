//
//  TransitionHelper.m
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import "TransitionHelper.h"
#import <objc/runtime.h>
#import "pushAnimation.h"
#import "popAnimation.h"
@interface TransitionHelper()
@property (nonatomic)CGAffineTransform bigTransform;
@property (nonatomic)CGAffineTransform smallTransform;
@end
@implementation TransitionHelper
-(instancetype)initWithBeginFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        CGFloat multipleX = SCREEN_WIDTH/frame.size.width;
        CGFloat multipleY = SCREEN_HEIGHT/frame.size.height;
        
        CGFloat translationX = SCREEN_WIDTH/2 - CGRectGetMidX(frame);
        CGFloat translationY = SCREEN_HEIGHT/2 - CGRectGetMidY(frame);
        
        CGAffineTransform bigTransformFirst = CGAffineTransformMakeScale(multipleX, multipleY);
        self.bigTransform = CGAffineTransformTranslate(bigTransformFirst, translationX, translationY);
        
        CGAffineTransform smallTransformFirst = CGAffineTransformMakeScale(1/multipleX,1/multipleY);
        self.smallTransform = CGAffineTransformTranslate(smallTransformFirst,-multipleX*translationX,-multipleY*translationY);
    }
    return self;
}

#pragma mark - UIViewController transitioning delegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.pushAnimation;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.popAnimation;
}

#pragma mark - UINavigationController delegate
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    }
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimation;
    }
    return nil;
}

#pragma mark - 懒加载
-(pushAnimation *)pushAnimation
{
    if (!_pushAnimation) {
        _pushAnimation = [[pushAnimation alloc]init];
        _pushAnimation.bigTransform = self.bigTransform;
    }
    return _pushAnimation;
}

-(popAnimation *)popAnimation
{
    if (!_popAnimation) {
        _popAnimation = [[popAnimation alloc]init];
        _popAnimation.bigTransform = self.bigTransform;
        _popAnimation.smallTransform = self.smallTransform;
    }
    return _popAnimation;
}
@end

static char kVCTransition;
@implementation UIViewController (LYTransition)

- (TransitionHelper *)transition{
    return objc_getAssociatedObject(self, &kVCTransition);
}

- (void)setTransition:(TransitionHelper *)transition{
    self.transitioningDelegate = transition;
    objc_setAssociatedObject(self, &kVCTransition, transition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

static char kNVTransition;
@implementation UINavigationController (LYTransition)

- (TransitionHelper *)navigationTransition{
    return objc_getAssociatedObject(self, &kNVTransition);
}

- (void)setNavigationTransition:(TransitionHelper *)navigationTransition{
    self.delegate = navigationTransition;
    objc_setAssociatedObject(self, &kNVTransition, navigationTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
