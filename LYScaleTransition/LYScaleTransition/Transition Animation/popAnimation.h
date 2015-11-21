//
//  popAnimation.h
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface popAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic)CGAffineTransform bigTransform;
@property (nonatomic)CGAffineTransform smallTransform;
@end
