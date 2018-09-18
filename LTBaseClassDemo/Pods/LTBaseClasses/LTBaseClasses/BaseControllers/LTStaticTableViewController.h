//
//  LTStaticTableViewController.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTTableViewController.h"
#import "LTItemSection.h"
#import "LTWordItem.h"
#import "LTWordArrowItem.h"

@interface LTStaticTableViewController : LTTableViewController


// 需要把组模型添加到数据中
@property (nonatomic, strong) NSMutableArray<LTItemSection *> *sections;


// 自定义某一行cell的时候调用super, 返回为空
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath NS_REQUIRES_SUPER;

- (LTStaticTableViewController *(^)(LTWordItem *item))addItem;

@end


UIKIT_EXTERN const UIEdgeInsets tableViewDefaultSeparatorInset;
UIKIT_EXTERN const UIEdgeInsets tableViewDefaultLayoutMargins;
