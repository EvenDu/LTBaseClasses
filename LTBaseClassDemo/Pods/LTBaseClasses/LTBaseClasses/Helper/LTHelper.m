//
// 	LTHelper.m 
//
//  Created by redmaple (Telegram:@hongfenglt) on  2018/9/5 .
//  Copyright © 2004-2018年 redmaple (https://github.com/hongfenglt)
//

#import "LTHelper.h"
#import "sys/utsname.h"

@implementation LTHelper

+ (BOOL)isIphoneX {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"]) {
        // judgment by height when in simulators
        return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
                CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)));
    }
    BOOL isIPhoneX = [platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"];
    return isIPhoneX;
}
+ (CGFloat)navBarBottom {
    return [[UIApplication sharedApplication] statusBarFrame].size.height + 44;
}
+ (CGFloat)tabBarHeight {
    return [self isIphoneX] ? 83 : 49;
}

+ (CGFloat)statusBarHeigth {
    return [[UIApplication sharedApplication] statusBarFrame].size.height;//[self isIphoneX] ? 49 : 20;
}
+ (CGFloat)safebottom {
    return [self isIphoneX] ? 34 : 0;
}

@end
