//
//  LTStaticPlainTableViewController.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/5/31.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTTableViewController.h"
#import "LTWordItem.h"
#import "LTWordArrowItem.h"

@interface LTStaticPlainTableViewController : LTTableViewController


// 需要把组模型添加到数据中
@property (nonatomic, strong) NSMutableArray<LTWordItem *> *items;

@end
