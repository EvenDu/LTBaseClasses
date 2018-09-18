//
// 	LTHelper.m 
//
//  Created by redmaple (Telegram:@hongfenglt) on  2018/9/5 .
//  Copyright © 2004-2018年 redmaple (https://github.com/hongfenglt)
//

#import "LTHelper.h"

static inline BOOL isIPhoneXSeries() {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        NSLog(@"safeAreaInsets:%f", mainWindow.safeAreaInsets.bottom);
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    
    return iPhoneXSeries;
}

@implementation LTHelper

+ (BOOL)isIphoneX {
    return isIPhoneXSeries();
}
+ (CGFloat)navBarBottom {
    return [[UIApplication sharedApplication] statusBarFrame].size.height + 44;
}
+ (CGFloat)tabBarHeight {
    return [self safebottom] + 49;
}

+ (CGFloat)statusBarHeigth {
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}
+ (CGFloat)safebottom {
    if (@available(iOS 11.0, *)) {
        return [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom;
    } else {
        return 0;
    }
}

@end
