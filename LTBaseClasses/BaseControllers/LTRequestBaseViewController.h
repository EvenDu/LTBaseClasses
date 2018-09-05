//
//  LTRequestBaseViewController.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTTextViewController.h"
#import "Reachability.h"

@class LTRequestBaseViewController;
@protocol LTRequestBaseViewControllerDelegate <NSObject>

@optional
#pragma mark - 网络监听
/*
 NotReachable = 0,
 ReachableViaWiFi = 2,
 ReachableViaWWAN = 1,
 ReachableVia2G = 3,
 ReachableVia3G = 4,
 ReachableVia4G = 5,
 */
- (void)networkStatus:(NetworkStatus)networkStatus inViewController:(LTRequestBaseViewController *)inViewController;

@end


@interface LTRequestBaseViewController : LTTextViewController <LTRequestBaseViewControllerDelegate>

//#pragma mark - 加载框
//- (void)showLoading;
//
//- (void)dismissLoading;

@end
