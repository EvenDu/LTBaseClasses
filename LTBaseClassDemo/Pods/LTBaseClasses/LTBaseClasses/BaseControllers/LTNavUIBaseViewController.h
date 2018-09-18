//
//  LTNavUIBaseViewController.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTNavigationController.h"
#import "LTNavigationBar.h"

@class LTNavUIBaseViewController;
@protocol LTNavUIBaseViewControllerDataSource <NSObject>

@optional
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(LTNavUIBaseViewController *)navUIBaseViewController;
@end

@interface LTNavUIBaseViewController : UIViewController <LTNavigationBarDelegate, LTNavigationBarDataSource, LTNavUIBaseViewControllerDataSource>

/*默认的导航栏字体*/
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle;
/**  */
@property (weak, nonatomic) LTNavigationBar *lt_navgationBar;

@end
