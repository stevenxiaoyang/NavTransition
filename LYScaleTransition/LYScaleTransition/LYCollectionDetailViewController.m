//
//  LYCollectionDetailViewController.m
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import "LYCollectionDetailViewController.h"

@implementation LYCollectionDetailViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self addImageView];
}

-(void)addImageView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [imageView setImage:[UIImage imageNamed:self.imageName]];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pop)];
    [imageView addGestureRecognizer:tapGest];
    [self.view addSubview:imageView];
}

-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
