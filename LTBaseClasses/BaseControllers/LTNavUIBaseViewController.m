//
//  LTNavUIBaseViewController.m
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTNavUIBaseViewController.h"
#import <sys/utsname.h>
#import "UIView+LTFrame.h"
#import "LTBaseClassMacro.h"
#import "NSObject+YYAddForKVO.h"



@interface LTNavUIBaseViewController ()

@end

@implementation LTNavUIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LTWeak(self);
    [self.navigationItem addObserverBlockForKeyPath:LTKeyPath(self.navigationItem, title) block:^(id  _Nonnull obj, id  _Nonnull oldVal, NSString  *_Nonnull newVal) {
        if (newVal.length > 0 && ![newVal isEqualToString:oldVal]) {
            weakself.title = newVal;
        }
    }];
}


#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.lt_navgationBar.lt_width = self.view.lt_width;
    [self.view bringSubviewToFront:self.lt_navgationBar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)dealloc {
    [self.navigationItem removeObserverBlocksForKeyPath:LTKeyPath(self.navigationItem, title)];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - DataSource
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(LTNavUIBaseViewController *)navUIBaseViewController {
    return YES;
}

/**头部标题*/
- (NSMutableAttributedString*)ltNavigationBarTitle:(LTNavigationBar *)navigationBar {
    return [self changeTitle:self.title ?: self.navigationItem.title];
}

/** 背景图片 */
//- (UIImage *)ltNavigationBarBackgroundImage:(LTNavigationBar *)navigationBar
//{
//
//}

/** 背景色 */
- (UIColor *)ltNavigationBackgroundColor:(LTNavigationBar *)navigationBar {
    return [UIColor whiteColor];
}

/** 是否显示底部黑线 */
//- (BOOL)ltNavigationIsHideBottomLine:(LTNavigationBar *)navigationBar
//{
//    return NO;
//}

/** 导航条的高度 */
- (CGFloat)ltNavigationHeight:(LTNavigationBar *)navigationBar {
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.0;
}


/** 导航条的左边的 view */
//- (UIView *)ltNavigationBarLeftView:(LTNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的 view */
//- (UIView *)ltNavigationBarRightView:(LTNavigationBar *)navigationBar
//{
//
//}
/** 导航条中间的 View */
//- (UIView *)ltNavigationBarTitleView:(LTNavigationBar *)navigationBar
//{
//
//}
/** 导航条左边的按钮 */
//- (UIImage *)ltNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LTNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的按钮 */
//- (UIImage *)ltNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(LTNavigationBar *)navigationBar
//{
//
//}



#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(LTNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(LTNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(LTNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}


#pragma mark 自定义代码

- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(0, title.length)];
    
    return title;
}


- (LTNavigationBar *)lt_navgationBar {
    // 父类控制器必须是导航控制器
    if(!_lt_navgationBar && [self.parentViewController isKindOfClass:[UINavigationController class]])
    {
        LTNavigationBar *navigationBar = [[LTNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        [self.view addSubview:navigationBar];
        _lt_navgationBar = navigationBar;
        
        navigationBar.dataSource = self;
        navigationBar.ltDelegate = self;
        navigationBar.hidden = ![self navUIBaseViewControllerIsNeedNavBar:self];
    }
    return _lt_navgationBar;
}




- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.lt_navgationBar.title = [self changeTitle:title];
}

@end

