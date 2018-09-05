//
//  LTCollectionViewController.m
//  YHVStore_Seller_iOS
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTCollectionViewController.h"


@interface LTCollectionViewController () <LTVerticalFlowLayoutDelegate>

@end

@implementation LTCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupBaseLTCollectionViewControllerUI];
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
}

- (void)setupBaseLTCollectionViewControllerUI
{
    
    self.collectionView.backgroundColor = self.view.backgroundColor;
    
    
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        
        if ([self respondsToSelector:@selector(ltNavigationHeight:)]) {
            
            self.collectionView.contentInset  = UIEdgeInsetsMake([self ltNavigationHeight:nil], 0, 0, 0);
        }
    }
    
    
}

#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor yellowColor];
    
    cell.contentView.clipsToBounds = YES;
    if (![cell.contentView viewWithTag:100]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        label.tag = 100;
        label.textColor = [UIColor redColor];
        label.font = [UIFont boldSystemFontOfSize:17];
        [cell.contentView addSubview:label];
    }
    
    UILabel *label = [cell.contentView viewWithTag:100];
    
    label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.item];
    
    
    return cell;
}

#pragma mark - scrollDeleggate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    UIEdgeInsets contentInset = self.collectionView.contentInset;
//    contentInset.bottom -= self.collectionView.mj_footer.lt_height;
//    self.collectionView.scrollIndicatorInsets = contentInset;
    
    [self.view endEditing:YES];
}

- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
        
        UICollectionViewLayout *myLayout = [self collectionViewController:self layoutForCollectionView:collectionView];
        
        collectionView.collectionViewLayout = myLayout;
        
        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
    }
    return _collectionView;
}


#pragma mark - LTCollectionViewControllerDataSource
- (UICollectionViewLayout *)collectionViewController:(LTCollectionViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView
{
    
    LTVerticalFlowLayout *myLayout = [[LTVerticalFlowLayout alloc] initWithDelegate:self];
    
    return myLayout;
}


#pragma mark - LTVerticalFlowLayoutDelegate

- (CGFloat)waterflowLayout:(LTVerticalFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth
{
    return itemWidth * (arc4random() % 4 + 1);
}


@end
