//
//  LTSettingCell.m
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTSettingCell.h"
#import "LTWordItem.h"
#import "LTWordArrowItem.h"
#import "LTItemSection.h"
#import "UIView+LTFrame.h"
#import "LTBaseClassMacro.h"

@implementation LTSettingCell {
    UIView *_lineView;
    UIImageView *_arrowImgV;
}

static NSString *const ID = @"LTSettingCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle)style
{
    LTSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupBaseSettingCellUI];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupBaseSettingCellUI];
}


- (void)setupBaseSettingCellUI
{
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = LTGrayColor(243);
    [self.contentView addSubview:_lineView];
    
    _arrowImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me_setting_cell_arrow"]];
    self.accessoryView = _arrowImgV;

//    [_arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.contentView);
//        make.right.mas_equalTo(YHRealW(35));
//    }];
    
}

- (void)setItem:(LTWordItem *)item
{
    _item = item;
    
    [self fillData];
    
    [self changeUI];
}

- (void)fillData
{
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.subTitle;
    self.imageView.image = self.item.image;
}

- (void)changeUI
{
    self.textLabel.font = self.item.titleFont;
    self.textLabel.textColor = self.item.titleColor;
    
    self.detailTextLabel.font = self.item.subTitleFont;
    self.detailTextLabel.textColor = self.item.subTitleColor;
    
    if ([self.item isKindOfClass:[LTWordArrowItem class]]) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _arrowImgV.hidden = NO;
        
    }else
    {
        self.accessoryType = UITableViewCellAccessoryNone;
        _arrowImgV.hidden = YES;
    }
    
    if (self.item.itemOperation || [self.item isKindOfClass:[LTWordArrowItem class]]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        _arrowImgV.hidden = NO;
    }else
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _arrowImgV.hidden = YES;
    }
    
//    _arrowImgV.hidden = self.selectionStyle == UITableViewCellSelectionStyleNone;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _lineView.frame = CGRectMake(0, self.lt_height - 1, self.lt_width, 1);
    self.imageView.lt_centerY = self.textLabel.lt_centerY;
}


@end
