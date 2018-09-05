//
//  LTTextViewController.h
//  LTBaseClass
//
//  Created by 洪峰 on 2018/3/5.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "LTNavUIBaseViewController.h"

@class LTTextViewController;
@protocol LTTextViewControllerDataSource <NSObject>

@optional
- (UIReturnKeyType)textViewControllerLastReturnKeyType:(LTTextViewController *)textViewController;

- (BOOL)textViewControllerEnableAutoToolbar:(LTTextViewController *)textViewController;

- (NSArray <UIButton *> *)textViewControllerRelationButtons:(LTTextViewController *)textViewController;

@end


@protocol LTTextViewControllerDelegate <UITextViewDelegate, UITextFieldDelegate>

@optional
#pragma mark - 最后一个输入框点击键盘上的完成按钮时调用
- (void)textViewController:(LTTextViewController *)textViewController inputViewDone:(id)inputView;
@end

@interface LTTextViewController : LTNavUIBaseViewController <LTTextViewControllerDataSource, LTTextViewControllerDelegate>

- (BOOL)textFieldShouldClear:(UITextField *)textField NS_REQUIRES_SUPER;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string NS_REQUIRES_SUPER;
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_REQUIRES_SUPER;
- (BOOL)textFieldShouldReturn:(UITextField *)textField NS_REQUIRES_SUPER;

@end

#pragma mark - design UITextField
IB_DESIGNABLE
@interface UITextField (LTTextViewController)

@property (assign, nonatomic) IBInspectable BOOL isEmptyAutoEnable;

@end


@interface LTTextViewControllerTextField : UITextField

@end
