//
//  LTCategories.h
//  LTCatrgory
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include(<LTCategories/LTCategories.h>)
FOUNDATION_EXPORT double LTCategoriesVersionNumber;
// Project version string for LTCategories.
FOUNDATION_EXPORT const unsigned char LTCategoriesVersionString[];
#import <LTCategories/UIView+LTFrame.h>
#import <LTCategories/UIView+LTGestureCallbackValues.h>
#import <LTCategories/UIButton+LTAdd.h>
#import <LTCategories/UIWindow+LTAdd.h>
#import <LTCategories/NSString+LTAdd.h>
#import <LTCategories/NSString+LTSize.h>
#import <LTCategories/UIView+LTAdd.h>
#import <LTCategories/UIFont+LTAdd.h>
#import "LTCategories/NSString+LTSafe.h"
#import "LTCategories/NSArray+LTSafe.h"
#import "LTCategories/NSDictionary+LTSafe.h"

#else

#import "UIView+LTFrame.h"
#import "UIView+LTGestureCallbackValues.h"
#import "UIButton+LTAdd.h"
#import "UIWindow+LTAdd.h"
#import "NSString+LTAdd.h"
#import "NSString+LTSize.h"
#import "UIView+LTAdd.h"
#import "UIFont+LTAdd.h"
#import "NSString+LTSafe.h"
#import "NSArray+LTSafe.h"
#import "NSDictionary+LTSafe.h"
#endif
