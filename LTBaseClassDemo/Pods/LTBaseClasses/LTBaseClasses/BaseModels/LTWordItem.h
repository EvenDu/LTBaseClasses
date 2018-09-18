//
//  LTWordItem.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LTWordItem : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 副标题的字体 */
@property (nonatomic, strong) UIFont *titleFont;
/** 主标题的颜色 */
@property (nonatomic, strong) UIColor *titleColor;

/** subTitle */
@property (nonatomic, copy) NSString *subTitle;
/** 副标题的字体 */
@property (nonatomic, strong) UIFont *subTitleFont;
/** 副标题的颜色 */
@property (nonatomic, strong) UIColor *subTitleColor;


/** 左边的图片 */
@property (nonatomic, strong) UIImage *image;

/** 设置cell的高度, 默认50 */
@property (assign, nonatomic) CGFloat cellHeight;


/** 是否自定义这个cell , 如果自定义, 则在tableview返回默认的cell, 自己需要自定义cell返回*/
@property (assign, nonatomic, getter=isNeedCustom) BOOL needCustom;

/** 点击操作 */
@property (nonatomic, copy) void(^itemOperation)(NSIndexPath *indexPath);

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle itemOperation:(void(^)(NSIndexPath *indexPath))itemOperation;

@end
