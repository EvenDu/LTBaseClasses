//
//  LTStaticPlainTableViewController.m
//  YHVStore_Seller_iOS
//
//  Created by 洪峰 on 2018/5/31.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTStaticPlainTableViewController.h"
#import "LTSettingCell.h"

@interface LTStaticPlainTableViewController ()

@end

@implementation LTStaticPlainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTWordItem *item = self.items[indexPath.row];
    
    
    LTSettingCell *cell = [LTSettingCell cellWithTableView:tableView andCellStyle:UITableViewCellStyleValue1];
    
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LTWordItem *item = self.items[indexPath.row];
    
    // 普通的cell
    if(item.itemOperation)
    {
        item.itemOperation(indexPath);
        return;
    }
    
    // 带箭头的cell
    if([item isKindOfClass:[LTWordArrowItem class]])
    {
        LTWordArrowItem *arrowItem = (LTWordArrowItem *)item;
        
        if(arrowItem.destVc)
        {
            UIViewController *vc = [[arrowItem.destVc alloc] init];
            vc.navigationItem.title = arrowItem.title;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row].cellHeight;
}

- (NSMutableArray<LTWordItem *> *)items
{
    if(_items == nil)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
