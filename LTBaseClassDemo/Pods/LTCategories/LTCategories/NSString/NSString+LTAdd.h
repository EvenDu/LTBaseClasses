//
//  NSString+LTAdd.h
//  LTCatrgory
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LTAdd)

- (BOOL)isChinese;
- (BOOL)isValidateNmumble;
- (BOOL)isNull;

/** 返回去除换行的字符串*/
- (NSString *)stringWithOutTabs;

/** 中划线*/
- (NSAttributedString *)strikeString;
/** 中划线*/
- (NSAttributedString *)strikeThroughString;
@end
