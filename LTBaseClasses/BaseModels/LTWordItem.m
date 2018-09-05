//
//  LTWordItem.m
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTWordItem.h"

@implementation LTWordItem

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    LTWordItem *item = [[self alloc] init];
    item.subTitle = subTitle;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle itemOperation:(void(^)(NSIndexPath *indexPath))itemOperation {
    LTWordItem *item = [self itemWithTitle:title subTitle:subTitle];
    item.itemOperation = itemOperation;
    return item;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        _titleColor = [UIColor blackColor];
        _subTitleColor = [UIColor blackColor];
        
        _cellHeight = 50;
        _titleFont = [UIFont systemFontOfSize:16];
        _subTitleFont = [UIFont systemFontOfSize:16];
        
    }
    
    return self;
}


@end
