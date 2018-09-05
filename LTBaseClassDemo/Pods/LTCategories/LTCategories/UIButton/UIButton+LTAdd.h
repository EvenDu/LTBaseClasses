//
//  UIButton+LTAdd.h
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, LTButtonEdgeInsetsStyle) {
    LTButtonEdgeInsetsStyleTop,   // image在上，label在下
    LTButtonEdgeInsetsStyleLeft,  // image在左，label在右
    LTButtonEdgeInsetsStyleBottom,// image在下，label在上
    LTButtonEdgeInsetsStyleRight  // image在右，label在左
};
@interface UIButton (LTAdd)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)lt_layoutButtonWithEdgeInsetsStyle:(LTButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space;

@end
