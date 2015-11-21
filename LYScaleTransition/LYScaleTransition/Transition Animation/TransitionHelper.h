//
//  TransitionHelper.h
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class pushAnimation;
@class popAnimation;
@interface TransitionHelper : NSObject<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic,strong)pushAnimation *pushAnimation;
@property (nonatomic,strong)popAnimation *popAnimation;
-(instancetype)initWithBeginFrame:(CGRect)frame;
@end

@interface UIViewController (LYTransition)

/**
 * 替代UIViewController的transitioningDelegate
 */
@property (strong, nonatomic) TransitionHelper *transition;

@end

@interface UINavigationController (LYTransition)

/**
 * 替代UINavigationController的delegate
 */
@property (strong, nonatomic) TransitionHelper *navigationTransition;

@end

