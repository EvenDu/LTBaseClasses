//
//  UIFont+LTAdd.m
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "UIFont+LTAdd.h"

#define LTScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define LTScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * LTScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * LTScreenHeightRatio)

@implementation UIFont (LTAdd)

+ (UIFont *)LTFontOfSize:(CGFloat)fontSize weight:(CGFloat)weight {
    
    return [UIFont systemFontOfSize:AdaptedWidth(fontSize) weight:weight];
}

+ (UIFont *)LTFontOfSize:(CGFloat)fontSize {
    
    return [UIFont systemFontOfSize:AdaptedWidth(fontSize)];
}

@end
