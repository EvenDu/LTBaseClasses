//
//  LTVerticalFlowLayout.m
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTVerticalFlowLayout.h"
#define LTXX(x) floorf(x)
#define LTXS(s) ceilf(s)

static const NSInteger LT_Columns_ = 3;
static const CGFloat LT_XMargin_ = 10;
static const CGFloat LT_YMargin_ = 10;
static const UIEdgeInsets LT_EdgeInsets_ = {20, 10, 10, 10};

@interface LTVerticalFlowLayout()

/** 所有的cell的attrbts */
@property (nonatomic, strong) NSMutableArray *lt_AtrbsArray;

/** 每一列的最后的高度 */
@property (nonatomic, strong) NSMutableArray *lt_ColumnsHeightArray;

- (NSInteger)columns;

- (CGFloat)xMargin;

- (CGFloat)yMarginAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)edgeInsets;

@end

@implementation LTVerticalFlowLayout


/**
 *  刷新布局的时候回重新调用
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    //如果重新刷新就需要移除之前存储的高度
    [self.lt_ColumnsHeightArray removeAllObjects];
    
    //复赋值以顶部的高度, 并且根据列数
    for (NSInteger i = 0; i < self.columns; i++) {
        
        [self.lt_ColumnsHeightArray addObject:@(self.edgeInsets.top)];
    }
    
    // 移除以前计算的cells的attrbs
    [self.lt_AtrbsArray removeAllObjects];
    
    // 并且重新计算, 每个cell对应的atrbs, 保存到数组
    for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++)
    {
        [self.lt_AtrbsArray addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    
    
    
}


/**
 *在这里边所处每个cell对应的位置和大小
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *atrbs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat w = 1.0 * (self.collectionView.frame.size.width - self.edgeInsets.left - self.edgeInsets.right - self.xMargin * (self.columns - 1)) / self.columns;
    
    w = LTXX(w);
    
    // 高度由外界决定, 外界必须实现这个方法
    CGFloat h = [self.delegate waterflowLayout:self collectionView:self.collectionView heightForItemAtIndexPath:indexPath itemWidth:w];
    
    // 拿到最后的高度最小的那一列, 假设第0列最小
    NSInteger indexCol = 0;
    CGFloat minColH = [self.lt_ColumnsHeightArray[indexCol] doubleValue];
    
    for (NSInteger i = 1; i < self.lt_ColumnsHeightArray.count; i++)
    {
        CGFloat colH = [self.lt_ColumnsHeightArray[i] doubleValue];
        if(minColH > colH)
        {
            minColH = colH;
            indexCol = i;
        }
    }
    
    
    CGFloat x = self.edgeInsets.left + (self.xMargin + w) * indexCol;
    
    CGFloat y = minColH + [self yMarginAtIndexPath:indexPath];
    
    // 是第一行
    if (minColH == self.edgeInsets.top) {
        
        y = self.edgeInsets.top;
    }
    
    // 赋值frame
    atrbs.frame = CGRectMake(x, y, w, h);
    
    // 覆盖添加完后那一列;的最新高度
    self.lt_ColumnsHeightArray[indexCol] = @(CGRectGetMaxY(atrbs.frame));
    
    return atrbs;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.lt_AtrbsArray;
}


- (CGSize)collectionViewContentSize
{
    CGFloat maxColH = [self.lt_ColumnsHeightArray.firstObject doubleValue];
    
    for (NSInteger i = 1; i < self.lt_ColumnsHeightArray.count; i++)
    {
        CGFloat colH = [self.lt_ColumnsHeightArray[i] doubleValue];
        if(maxColH < colH)
        {
            maxColH = colH;
        }
    }
    
    return CGSizeMake(self.collectionView.frame.size.width, maxColH + self.edgeInsets.bottom);
}


- (NSMutableArray *)lt_AtrbsArray
{
    if(_lt_AtrbsArray == nil)
    {
        _lt_AtrbsArray = [NSMutableArray array];
    }
    return _lt_AtrbsArray;
}

- (NSMutableArray *)lt_ColumnsHeightArray
{
    if(_lt_ColumnsHeightArray == nil)
    {
        _lt_ColumnsHeightArray = [NSMutableArray array];
    }
    return _lt_ColumnsHeightArray;
}

- (NSInteger)columns
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:columnsInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self columnsInCollectionView:self.collectionView];
    }
    else
    {
        return LT_Columns_;
    }
}

- (CGFloat)xMargin
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:columnsMarginInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self columnsMarginInCollectionView:self.collectionView];
    }
    else
    {
        return LT_XMargin_;
    }
}

- (CGFloat)yMarginAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:collectionView:linesMarginForItemAtIndexPath:)])
    {
        return [self.delegate waterflowLayout:self collectionView:self.collectionView linesMarginForItemAtIndexPath:indexPath];
    }else
    {
        return LT_YMargin_;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:edgeInsetsInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self edgeInsetsInCollectionView:self.collectionView];
    }
    else
    {
        return LT_EdgeInsets_;
    }
}

- (id<LTVerticalFlowLayoutDelegate>)delegate
{
    return (id<LTVerticalFlowLayoutDelegate>)self.collectionView.dataSource;
}

- (instancetype)initWithDelegate:(id<LTVerticalFlowLayoutDelegate>)delegate
{
    if (self = [super init]) {
        
    }
    return self;
}


+ (instancetype)flowLayoutWithDelegate:(id<LTVerticalFlowLayoutDelegate>)delegate
{
    return [[self alloc] initWithDelegate:delegate];
}

@end
