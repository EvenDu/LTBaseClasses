//
//  UIView+LTFrame.h
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LTFrame)

@property (nonatomic) CGFloat lt_x;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat lt_y;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat lt_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat lt_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat lt_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat lt_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat lt_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat lt_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint lt_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  lt_size;        ///< Shortcut for frame.size.


@end
