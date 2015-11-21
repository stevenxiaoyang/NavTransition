//
//  ViewController.m
//  LYScaleTransition
//
//  Created by YiTe on 15/11/21.
//  Copyright © 2015年 LuYang. All rights reserved.
//

#import "LYCollectionViewController.h"
#import "LYCollectionDetailViewController.h"
#import "ImageCollectionViewCell.h"
#import "CollectionLayout/CustomCollectionViewLayout.h"
#import "Transition Animation/TransitionHelper.h"
static const NSInteger dataCount = 50;
@interface LYCollectionViewController ()
@property (nonatomic,strong)NSMutableArray *dataSourceArray;
@end

@implementation LYCollectionViewController
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"瀑布流";
    self.collectionView.collectionViewLayout = [[CustomCollectionViewLayout alloc]init];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    /*
     模拟数据源
     */
    _dataSourceArray = [[NSMutableArray alloc]initWithCapacity:dataCount];
    for (NSInteger i = 0; i < dataCount; i++) {
        NSInteger imageIndex = arc4random() % 10;
        NSString *imageName = [NSString stringWithFormat:@"00%ld.jpg", imageIndex];
        [_dataSourceArray addObject:imageName];
    }

}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setImage:_dataSourceArray[indexPath.row]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    CGRect frame = [collectionView convertRect:cell.frame toView:self.view];
    self.navigationController.navigationTransition = [[TransitionHelper alloc]initWithBeginFrame:frame];
    
    LYCollectionDetailViewController *destVC = [[LYCollectionDetailViewController alloc]init];
    destVC.imageName = _dataSourceArray[indexPath.row];
    destVC.navigationController.navigationTransition = self.navigationController.navigationTransition;
    [self.navigationController pushViewController:destVC animated:YES];
}

@end
