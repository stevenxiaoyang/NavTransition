//
//  ImageCollectionViewCell.m
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import "ImageCollectionViewCell.h"
@interface ImageCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@end
@implementation ImageCollectionViewCell
-(void)setImage:(NSString *)imageName
{
    [_cellImageView setImage:[UIImage imageNamed:imageName]];
}
@end
