//
//  AppDelegate.h
//  LTBaseClassDemo
//
//  Created by 洪峰 on 2018/9/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
typedef void(^TestBlock)();
#pragma clang diagnostic pop

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

