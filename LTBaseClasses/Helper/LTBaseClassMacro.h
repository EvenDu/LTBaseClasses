//
//  LTBaseClassMacro.h
//  LTBaseClassDemo
//
//  Created by 洪峰 on 2018/9/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#ifndef LTBaseClassMacro_h
#define LTBaseClassMacro_h

#import "LTHelper.h"

/**
 *  属性转字符串
 */
#define LTKeyPath(obj, key) @(((void)obj.key, #key))
#define LTWeak(type)  __weak typeof(type) weak##type = type

#define LTIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/*** 当前系统版本判断 ***/
#define LTiOS(version) ([UIDevice currentDevice].systemVersion.doubleValue >= (version))

/*** 颜色 ***/
#define LTColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define LTColor(r, g, b) LTColorA((r), (g), (b), 255)
#define LTRandomColor LTColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define LTGrayColor(v) LTColor((v), (v), (v))

#define LTScreenWidth [UIScreen mainScreen].bounds.size.width
#define LTScreenHeigth [UIScreen mainScreen].bounds.size.height

#endif /* LTBaseClassMacro_h */
