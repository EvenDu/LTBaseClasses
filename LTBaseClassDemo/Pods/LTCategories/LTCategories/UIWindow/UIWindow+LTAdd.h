//
//  UIWindow+LTAdd.h
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (LTAdd)

/*!
 @method currentViewController
 
 @return Returns the topViewController in stack of topMostController.
 */
+ (UIViewController*)lt_currentViewController;

@end
