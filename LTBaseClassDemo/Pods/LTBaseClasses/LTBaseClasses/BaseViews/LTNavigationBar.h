//
//  LTNavigationBar.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTNavigationBar;
// 主要处理导航条
@protocol  LTNavigationBarDataSource<NSObject>

@optional

/**头部标题*/
- (NSMutableAttributedString*)ltNavigationBarTitle:(LTNavigationBar *)navigationBar;

/** 背景图片 */
- (UIImage *)ltNavigationBarBackgroundImage:(LTNavigationBar *)navigationBar;
/** 背景色 */
- (UIColor *)ltNavigationBackgroundColor:(LTNavigationBar *)navigationBar;
/** 是否显示底部黑线 */
- (BOOL)ltNavigationIsHideBottomLine:(LTNavigationBar *)navigationBar;
/** 导航条的高度 */
- (CGFloat)ltNavigationHeight:(LTNavigationBar *)navigationBar;


/** 导航条的左边的 view */
- (UIView *)ltNavigationBarLeftView:(LTNavigationBar *)navigationBar;
/** 导航条右边的 view */
- (UIView *)ltNavigationBarRightView:(LTNavigationBar *)navigationBar;
/** 导航条中间的 View */
- (UIView *)ltNavigationBarTitleView:(LTNavigationBar *)navigationBar;
/** 导航条左边的按钮 */
- (UIImage *)ltNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LTNavigationBar *)navigationBar;
/** 导航条右边的按钮 */
- (UIImage *)ltNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(LTNavigationBar *)navigationBar;
@end


@protocol LTNavigationBarDelegate <NSObject>

@optional
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(LTNavigationBar *)navigationBar;
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(LTNavigationBar *)navigationBar;
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(LTNavigationBar *)navigationBar;
@end

@interface LTNavigationBar : UIView

/** 底部的黑线 */
@property (weak, nonatomic) UIView *bottomBlackLineView;

/** <#digest#> */
@property (weak, nonatomic) UIView *titleView;

/** <#digest#> */
@property (weak, nonatomic) UIView *leftView;

/** <#digest#> */
@property (weak, nonatomic) UIView *rightView;

/** <#digest#> */
@property (nonatomic, copy) NSMutableAttributedString *title;

/** <#digest#> */
@property (weak, nonatomic) id<LTNavigationBarDataSource> dataSource;

/** <#digest#> */
@property (weak, nonatomic) id<LTNavigationBarDelegate> ltDelegate;

/** <#digest#> */
@property (weak, nonatomic) UIImage *backgroundImage;


@end
