//
//  NSArray+LTSafe.h
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSArray (LTSafe)

- (id)lt_safeObjectAtIndex:(NSUInteger)index;
- (id)lt_safeObjectAtIndex:(NSUInteger)index class:(Class)aClass;

- (bool)lt_boolAtIndex:(NSUInteger)index;
- (CGFloat)lt_floatAtIndex:(NSUInteger)index;
- (NSInteger)lt_integerAtIndex:(NSUInteger)index;
- (int)lt_intAtIndex:(NSUInteger)index;
- (long)lt_longAtIndex:(NSUInteger)index;
- (NSNumber *)lt_numberAtIndex:(NSUInteger)index;
- (NSString *)lt_stringAtIndex:(NSUInteger)index;
- (NSDictionary *)lt_dictionaryAtIndex:(NSUInteger)index;
- (NSArray *)lt_arrayAtIndex:(NSUInteger)index;
- (NSMutableDictionary *)lt_mutableDictionaryAtIndex:(NSUInteger)index;
- (NSMutableArray *)lt_mutableArrayAtIndex:(NSUInteger)index;

@end


@interface NSMutableArray (LTSafe)

- (void)lt_safeAddObject:(id)anObject;
- (void)lt_safeInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)lt_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)lt_safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)lt_safeRemoveObject:(id)anObject;

@end
