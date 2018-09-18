//
//  LTTableViewController.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTBaseViewController.h"

@interface LTTableViewController : LTBaseViewController <UITableViewDelegate, UITableViewDataSource>

// 这个代理方法如果子类实现了, 必须调用super
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

/** <#digest#> */
@property (weak, nonatomic) UITableView *tableView;

// tableview的样式, 默认plain
- (instancetype)initWithStyle:(UITableViewStyle)style;

@end
