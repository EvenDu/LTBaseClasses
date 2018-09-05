//
//  NSString+LTAdd.m
//  LTCatrgory
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "NSString+LTAdd.h"
#import <UIKit/UIKit.h>

@implementation NSString (LTAdd)

- (BOOL)isChinese
{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidateNmumble
{
    NSString    *number=@"^[0-9]*$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:self];
}

- (BOOL)isNull
{
    if (self==nil||[self isEqualToString:@""]||[self isEqual:[NSNull null]]||[self isEqual:NULL] || [self isEqualToString:@"(null)"]) {
        return YES;
    }
    return NO;
}

/** 返回去除换行的字符串*/
- (NSString *)stringWithOutTabs {
    NSString *str = self;
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去除掉首尾的空白字符和换行字符
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}

- (NSAttributedString *)strikeString {
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    [attribtStr setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0, self.length)];
    return attribtStr;
}

- (NSAttributedString *)strikeThroughString {
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSRange titleRange = {0,[attribtStr length]};
    [attribtStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    return attribtStr;
}

@end
