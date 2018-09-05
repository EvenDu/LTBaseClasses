//
//  NSArray+LTSafe.m
//  RedMaple
//
//  Created by 洪峰 on 2018/9/4.
//  Copyright © 2018年 洪峰. All rights reserved.
//

#import "NSArray+LTSafe.h"
#import "NSString+LTSafe.h"


@implementation NSArray (LTSafe)

- (id)lt_safeObjectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (id)lt_safeObjectAtIndex:(NSUInteger)index class:(Class)aClass
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:aClass]) {
        return value;
    }
    return nil;
}

- (bool)lt_boolAtIndex:(NSUInteger)index
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return NO;
}

- (CGFloat)lt_floatAtIndex:(NSUInteger)index
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

- (NSInteger)lt_integerAtIndex:(NSUInteger)index
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    return 0;
}

- (int)lt_intAtIndex:(NSUInteger)index
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

- (long)lt_longAtIndex:(NSUInteger)index
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longValue];
    }
    return 0;
}

- (NSNumber *)lt_numberAtIndex:(NSUInteger)index
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(numberValue)]) {
        return [value numberValue];
    }
    return nil;
}

- (NSString *)lt_stringAtIndex:(NSUInteger)index
{
    id value = [self lt_safeObjectAtIndex:index];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(stringValue)]) {
        return [value stringValue];
    }
    return nil;
}

- (NSArray *)lt_arrayAtIndex:(NSUInteger)index
{
    return [self lt_safeObjectAtIndex:index class:[NSArray class]];
}

- (NSDictionary *)lt_dictionaryAtIndex:(NSUInteger)index
{
    return [self lt_safeObjectAtIndex:index class:[NSDictionary class]];
}

- (NSMutableArray *)lt_mutableArrayAtIndex:(NSUInteger)index
{
    return [self lt_safeObjectAtIndex:index class:[NSMutableArray class]];
}

- (NSMutableDictionary *)lt_mutableDictionaryAtIndex:(NSUInteger)index
{
    return [self lt_safeObjectAtIndex:index class:[NSMutableDictionary class]];
}

@end

@implementation NSMutableArray (LTSafe)

- (void)lt_safeAddObject:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)lt_safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= self.count) {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)lt_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)lt_safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)lt_safeRemoveObject:(id)anObject
{
    if (anObject != nil) {
        [self removeObject:anObject];
    }
}

@end
