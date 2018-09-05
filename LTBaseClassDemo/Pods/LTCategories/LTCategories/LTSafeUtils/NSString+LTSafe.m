//
//  NSString+LTSafe.m
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "NSString+LTSafe.h"

@implementation NSString (LTSafe)

- (long)longValue
{
    return (long)[self integerValue];
}

- (NSNumber *)numberValue
{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    return [formatter numberFromString:self];
}

@end
