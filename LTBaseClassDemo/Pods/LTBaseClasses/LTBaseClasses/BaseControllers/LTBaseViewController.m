//
//  LTBaseViewController.m
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTBaseViewController.h"

@interface LTBaseViewController ()

@end

@implementation LTBaseViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];//[UIColor colorWithHexString:@"f0f0f0"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)){
            [[UIScrollView appearanceWhenContainedInInstancesOfClasses:@[[LTBaseViewController class]]] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 配置友盟统计
//    [YHUMengHelper beginLogPageViewName:self.title ?: self.navigationItem.title];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // 配置友盟统计
//    [YHUMengHelper endLogPageViewName:self.title ?: self.navigationItem.title];
    
}

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        self.title = title.copy;
    }
    return self;
}

//- (UIImage *)ltNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LTNavigationBar *)navigationBar
//{
//    [leftButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateHighlighted];
//
//    return [UIImage imageNamed:@"navigationButtonReturnClick"];
//}
//
//- (void)leftButtonEvent:(UIButton *)sender navigationBar:(LTNavigationBar *)navigationBar
//{
//    NSLog(@"%s", __func__);
//
//    [self.navigationController popViewControllerAnimated:YES];
//}


- (void)dealloc
{
    NSLog(@"dealloc---%@", self.class);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
