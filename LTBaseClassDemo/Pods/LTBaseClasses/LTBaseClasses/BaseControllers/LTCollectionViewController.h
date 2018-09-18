//
//  LTCollectionViewController.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTBaseViewController.h"
#import "LTElementsFlowLayout.h"
#import "LTVerticalFlowLayout.h"
#import "LTHorizontalFlowLayout.h"

@class LTCollectionViewController;
@protocol LTCollectionViewControllerDataSource <NSObject>

@required
// 需要返回对应的布局
- (UICollectionViewLayout *)collectionViewController:(LTCollectionViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView;

@end

@interface LTCollectionViewController : LTBaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, LTCollectionViewControllerDataSource>

/** <#digest#> */
@property (weak, nonatomic) UICollectionView *collectionView;

@end
