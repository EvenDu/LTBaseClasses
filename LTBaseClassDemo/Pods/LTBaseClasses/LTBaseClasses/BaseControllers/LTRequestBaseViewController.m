//
//  LTRequestBaseViewController.m
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTRequestBaseViewController.h"
#import "LTBaseClassMacro.h"

@interface LTRequestBaseViewController ()

/** <#digest#> */
@property (nonatomic, strong) Reachability *reachHost;

@end

@implementation LTRequestBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self reachHost];
}


#pragma mark - 加载框
- (void)showLoading
{
//    [MBProgressHUD showMessage:@"加载中..." toView:self.view];
}

- (void)dismissLoading
{
//    [MBProgressHUD hideHUDForView:self.view];
}


#define kURL_Reachability__Address @"www.baidu.com"
#pragma mark - 监听网络状态
- (Reachability *)reachHost
{
    if(_reachHost == nil)
    {
        _reachHost = [Reachability reachabilityWithHostName:kURL_Reachability__Address];
        
        LTWeak(self);
        [_reachHost setUnreachableBlock:^(Reachability * reachability){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakself networkStatus:reachability.currentReachabilityStatus inViewController:weakself];
                
            });
            
        }];
        
        
        [_reachHost setReachableBlock:^(Reachability * reachability){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakself networkStatus:reachability.currentReachabilityStatus inViewController:weakself];
                
            });
            
        }];
        
        [_reachHost startNotifier];
        
    }
    return _reachHost;
}


#pragma mark - LTRequestBaseViewControllerDelegate
- (void)networkStatus:(NetworkStatus)networkStatus inViewController:(LTRequestBaseViewController *)inViewController
{
    //判断网络状态
    switch (networkStatus) {
        case NotReachable:
//            [MBProgressHUD showError:@"当前网络连接失败，请查看设置" toView:self.view];
            NSLog(@"network error");
            break;
        case ReachableViaWiFi:
            NSLog(@"wifi上网2");
            break;
        case ReachableViaWWAN:
            NSLog(@"手机上网2");
            break;
        default:
            break;
    }
    
}


- (void)dealloc
{
    if ([self isViewLoaded]) {
//        [MBProgressHUD hideHUDForView:self.view animated:NO];
    }
    [_reachHost stopNotifier];
    _reachHost = nil;
}

@end
