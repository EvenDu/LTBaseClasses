//
//  NSDictionary+LTSafe.h
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface NSDictionary (LTSafe)

- (id)lt_safeObjectForKey:(id)key;
- (id)lt_safeObjectForKey:(id)key class:(Class)aClass;

- (bool)lt_boolForKey:(id)key;
- (CGFloat)lt_floatForKey:(id)key;
- (NSInteger)lt_integerForKey:(id)key;
- (int)lt_intForKey:(id)key;
- (long)lt_longForKey:(id)key;
- (NSNumber *)lt_numberForKey:(id)key;
- (NSString *)lt_stringForKey:(id)key;
- (NSDictionary *)lt_dictionaryForKey:(id)key;
- (NSArray *)lt_arrayForKey:(id)key;
- (NSMutableDictionary *)lt_mutableDictionaryForKey:(id)key;
- (NSMutableArray *)lt_mutableArrayForKey:(id)key;

@end

@interface NSMutableDictionary (LTSafe)

- (void)lt_safeSetObject:(id)anObject forKey:(id)key;
- (void)lt_safeRemoveObjectForKey:(id)key;

@end
