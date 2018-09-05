//
//  UIView+LTAdd.h
//  LTCatrgory
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LTAdd)

/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)RandomColor;


#define  LT_HexColor(hex)        [UIColor colorWithHexString:@#hex]
// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
