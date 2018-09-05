//
//  UIView+LTFrame.m
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "UIView+LTFrame.h"

@implementation UIView (LTFrame)

- (CGFloat)lt_x {
    return self.frame.origin.x;
}

- (void)setLt_x:(CGFloat)lt_x {
    CGRect frame = self.frame;
    frame.origin.x = lt_x;
    self.frame = frame;
}

- (CGFloat)lt_y {
    return self.frame.origin.y;
}

- (void)setLt_y:(CGFloat)lt_y {
    CGRect frame = self.frame;
    frame.origin.y = lt_y;
    self.frame = frame;
}

- (CGFloat)lt_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLt_right:(CGFloat)lt_right {
    CGRect frame = self.frame;
    frame.origin.x = lt_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)lt_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLt_bottom:(CGFloat)lt_bottom {
    
    CGRect frame = self.frame;
    
    frame.origin.y = lt_bottom - frame.size.height;
    
    self.frame = frame;
}

- (CGFloat)lt_width {
    return self.frame.size.width;
}

- (void)setLt_width:(CGFloat)lt_width {
    CGRect frame = self.frame;
    frame.size.width = lt_width;
    self.frame = frame;
}

- (CGFloat)lt_height {
    return self.frame.size.height;
}

- (void)setLt_height:(CGFloat)lt_height {
    CGRect frame = self.frame;
    frame.size.height = lt_height;
    self.frame = frame;
}

- (CGFloat)lt_centerX {
    return self.center.x;
}

- (void)setLt_centerX:(CGFloat)lt_centerX {
    self.center = CGPointMake(lt_centerX, self.center.y);
}

- (CGFloat)lt_centerY {
    return self.center.y;
}

- (void)setLt_centerY:(CGFloat)lt_centerY {
    self.center = CGPointMake(self.center.x, lt_centerY);
}

- (CGPoint)lt_origin {
    return self.frame.origin;
}

- (void)setLt_origin:(CGPoint)lt_origin {
    CGRect frame = self.frame;
    frame.origin = lt_origin;
    self.frame = frame;
}

- (CGSize)lt_size {
    return self.frame.size;
}

- (void)setLt_size:(CGSize)lt_size {
    CGRect frame = self.frame;
    frame.size = lt_size;
    self.frame = frame;
}

@end
